ActiveAdmin.register Device do

  actions :index, :show, :create, :edit, :update

  preserve_default_filters!
  remove_filter :device_readings

  permit_params :serial_number, :firmware_version, :registered_on

  sidebar "Details",  only: [:show, :this_week, :this_month, :this_year] do
    attributes_table_for device do
      device_reading = device.device_readings.last
      row :serial_number
      row :firmware_version
      row :registered_on
      row 'readings count' do
        device.device_readings.count
      end
      if device_reading
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
  end

  controller do
    def show
      @device_readings = resource.device_readings
    end
  end

  action_item :today, except: [ :index, :new ] do
    link_to 'Today', admin_device_device_readings_path(device)
  end

  action_item :this_week, except: [ :index, :new ] do
    link_to 'This Week', this_week_admin_device_path(device)
  end

  member_action :this_week do
    @device = resource
    @device_readings = @device.device_readings.this_week
  end

  action_item :this_month, except: [ :index, :new ] do
    link_to 'This Month', this_month_admin_device_path(device)
  end

  member_action :this_month do
    @device = resource
    @device_readings = @device.device_readings.this_month
  end

  action_item :this_year, except: [ :index, :new ] do
    link_to 'This Year', this_year_admin_device_path(device)
  end

  member_action :this_year do
    @device = resource
    @device_readings = @device.device_readings.this_year
  end

end
