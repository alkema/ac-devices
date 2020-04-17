ActiveAdmin.register DeviceReading do

  actions :index

  preserve_default_filters!
  remove_filter :device

  belongs_to :device

end
