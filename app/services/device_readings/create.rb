# Create device reading
class DeviceReadings::Create

  extend Callable

  NOTIFIABLE_STATUSES = %w[needs_service needs_new_filter gas_leak].freeze

  def initialize(reading_params)
    @device_reading = DeviceReading.new(reading_params)
  end

  def call
    @device_reading.save!

    notify!

    @device_reading
  end

  private

  def notify!
    create_health_status_notification if notifiable_health_status?
    create_carbon_monoxide_notification if notifiable_carbon_monoxide?
  end

  def create_health_status_notification
    @device_reading.notifications.create(warning_type: :health_status)
  end

  def create_carbon_monoxide_notification
    @device_reading.notifications.create(warning_type: :carbon_monoxide)
  end

  def notifiable_health_status?
    NOTIFIABLE_STATUSES.include?(@device_reading.health_status)
  end

  def notifiable_carbon_monoxide?
    @device_reading.carbon_monoxide > 9
  end

end
