ActiveAdmin.register DeviceReading do

  scope :all, default: true

  scope :this_week
  scope :this_month
  scope :this_year

  permit_params :device_id, :temperature, :humidity, :carbon_monoxide, :health_status, :reading_at

end
