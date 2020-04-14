class Api::HttpError

  attr_accessor :status
  attr_accessor :message
  attr_accessor :code

  def initialize(status:, message:)
    @status = status
    @message = message
    @code = code
  end

  def code
    Rack::Utils::SYMBOL_TO_STATUS_CODE[@status]
  end

  def error_attributes
    {
      code: @code,
      status: @status.to_s,
      message: @message
    }
  end

end

class Api::V1::DevicesController < ApplicationController

  before_action :set_api_v1_device, only: [:show, :edit, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  # GET /api/v1/devices/1
  # GET /api/v1/devices/1.json
  def show
  end

  # POST /api/v1/devices
  # POST /api/v1/devices.json
  def create
    @device = Device.new(api_v1_device_params)

    respond_to do |format|
      if @device.save
        format.html { redirect_to @device, notice: 'Device was successfully created.' }
        format.json { render :show, status: :created, location: @device }
      else
        format.html { render :new }
        format.json { render json: @device.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_api_v1_device
    @device = Device.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def api_v1_device_params
    params.fetch(:api_v1_device, {})
  end

  def not_found(error)
    http_error = Api::HttpError.new(
      status: :not_found,
      message: error.message
    )

    render_error(http_error)
  end

  def render_error(http_error)
    json = { error: http_error.error_attributes }

    render(json: json, status: http_error.code) && return
  end

end
