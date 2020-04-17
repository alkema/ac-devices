ActiveAdmin.register DeviceReading do

  actions :index

  preserve_default_filters!
  remove_filter :device

  belongs_to :device

  action_item :today, only: [ :index ] do
    link_to 'Today (+ historical)', admin_device_device_readings_path(device)
  end

  action_item :this_week, only: [ :index ] do
    link_to 'This Week', this_week_admin_device_path(device)
  end

  member_action :this_week do
    @device = resource
    @device_readings = @device.device_readings.this_week
  end

  action_item :this_month, only: [ :index ] do
    link_to 'This Month', this_month_admin_device_path(device)
  end

  member_action :this_month do
    @device = resource
    @device_readings = @device.device_readings.this_month
  end

  action_item :this_year, only: [ :index ] do
    link_to 'This Year', this_year_admin_device_path(device)
  end

  member_action :this_year do
    @device = resource
    @device_readings = @device.device_readings.this_year
  end

end
