ActiveAdmin.register Device do

  permit_params :serial_number, :firmware_version, :registered_on

  show do
    render 'charts', { device: device }
  end

  sidebar "Details",  only: [:show, :this_week, :this_month, :this_year] do
    attributes_table_for device do
      device_reading = device.device_readings.last
      row :serial_number
      row :firmware_version
      row :registered_on
      row 'current temperature' do
        device_reading.temperature
      end
      row 'current humidity' do
        device_reading.humidity
      end
      row 'current carbon monoxide' do
        device_reading.carbon_monoxide
      end
      row 'current health status' do
        device_reading.health_status
      end
    end
  end

  action_item :show, only: [:this_week, :this_month, :this_year] do
    link_to "#{device.serial_number} Details", admin_device_path(device)
  end

  action_item :this_week, only: [:show, :this_month, :this_year] do
    link_to 'This Week', this_week_admin_device_path(device)
  end

  member_action :this_week do
    @device = resource
    @device_readings = @device.device_readings.this_week
  end

  action_item :this_month, only: [:show, :this_week, :this_year] do
    link_to 'This Month', this_month_admin_device_path(device)
  end

  member_action :this_month do
    @device = resource
    @device_readings = @device.device_readings.this_month
  end

  action_item :this_year, only: [:show, :this_week, :this_month] do
    link_to 'This Year', this_year_admin_device_path(device)
  end

  member_action :this_year do
    @device = resource
    @device_readings = @device.device_readings.this_year
  end

end
