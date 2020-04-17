class Notification < ApplicationRecord

  belongs_to :device_reading

  scope :unresolved, -> { where(resolved: false)  }

end
