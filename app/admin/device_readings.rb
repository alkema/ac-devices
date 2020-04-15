ActiveAdmin.register DeviceReading do

  scope :all, default: true

  # assumes the model has a scope called ':active'
  scope :this_week
  scope :this_month
  scope :this_year

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :device_id, :temperature, :humidity, :carbon_monoxide, :health_status, :reading_at
  #
  # or
  #
  # permit_params do
  #   permitted = [:device_id, :temperature, :humidity, :carbon_monoxide, :health_status, :reading_at]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
