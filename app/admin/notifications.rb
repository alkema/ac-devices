ActiveAdmin.register Notification do

  actions :index, :show, :edit, :update

  scope('Unresolved', default: true) { |scope| scope.unresolved }
  scope('Resolved') { |scope| scope.where(resolved: true) }

  permit_params :resolved

  preserve_default_filters!
  remove_filter :device_reading

  index do
    id_column
    column :device_reading do |notification|
      link_to notification.device_reading.reading_at, admin_device_device_readings_path(notification.device_reading)
    end
    column :device do |notification|
      notification.device_reading.device
    end
    column :warning_value do |notification|
      notification.device_reading.send(notification.warning_type)
    end
    column :warning_type
    column :resolved
    actions
  end

  form title: 'Update' do |f|
    inputs 'Resolved' do
      input :resolved
    end
    para "Mark notifcation resolved once all protocols have ben followed."
    actions
  end

  sidebar "Details",  only: [:edit] do
    attributes_table do
      row :device_reading do |notification|
        link_to notification.device_reading.reading_at, admin_device_device_readings_path(notification.device_reading)
      end
      row :device do |notification|
        notification.device_reading.device
      end
      row :warning_value do |notification|
        notification.device_reading.send(notification.warning_type)
      end
      row :warning_type
      row :resolved
    end
  end

  show do
    attributes_table do
      row :device_reading do |notification|
        link_to notification.device_reading.reading_at, admin_device_device_readings_path(notification.device_reading)
      end
      row :device do |notification|
        notification.device_reading.device
      end
      row :warning_value do |notification|
        notification.device_reading.send(notification.warning_type)
      end
      row :warning_type
      row :resolved
    end
  end

end
