class Api::V1::DevicesController < ActionController::API

  include Api::Rescuable
  include Api::Authenticatable

  before_action :set_device, only: [:show]

  # GET /api/v1/devices/1
  # GET /api/v1/devices/1.json
  def show
  end

  # POST /api/v1/devices
  # POST /api/v1/devices.json
  def create
    @device = Device.new(device_params)

    if @device.save!
      render :show, status: :created, location: api_v1_device_url(@device, format: :json)
    end
  end

  private

  def set_device
    @device = Device.find(params[:id])
  end

  def device_params
    params.require(:device).permit(
      :serial_number,
      :firmware_version,
      :registered_on
    )
  end

end
