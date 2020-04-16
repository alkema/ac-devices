class Api::V1::ReadingsController < ActionController::API

  include Api::Rescuable
  include Api::Authenticatable

  # POST /api/v1/readings
  # POST /api/v1/readings.json
  def create
    @device_reading = DeviceReading.new(reading_params)

    if @device_reading.save!
      render :show, status: :created, location: api_v1_reading_url(@device_reading, format: :json)
    end
  end

  private

  def reading_params
    params.require(:reading).permit(
      :device_id,
      :temperature,
      :humidity,
      :carbon_monoxide,
      :health_status,
      :reading_at
    )
  end

end
