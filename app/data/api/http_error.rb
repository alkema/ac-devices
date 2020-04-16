# frozen_string_literal: true

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
