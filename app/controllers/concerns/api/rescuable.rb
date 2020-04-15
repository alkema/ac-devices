# API Authentication controller module
module Api::Rescuable

  extend ActiveSupport::Concern

  class InvalidToken < StandardError; end

  # rubocop:disable Metrics/BlockLength
  included do
    rescue_from Api::Rescuable::InvalidToken, with: :invalid_token
    rescue_from ActiveRecord::RecordNotFound, with: :not_found
    rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity
    rescue_from ActiveModel::ForbiddenAttributesError, with: :unprocessable_entity

    # unless Rails.env.development?
    #    rescue_from NoMethodError, with: :internal_server_error
    #    rescue_from StandardError, with: :internal_server_error
    # end
    #
    def invalid_token
      http_error = Api::HttpError.new(
        status: :unauthorized,
        message: 'Authentication token not valid'
      )

      render_error(http_error)
    end

    def not_found(error)
      http_error = Api::HttpError.new(
        status: :not_found,
        message: error.message
      )

      render_error(http_error)
    end

    def unprocessable_entity(error)
      http_error = Api::HttpError.new(
        status: :unprocessable_entity,
        message: error.message
      )

      render_error(http_error)
    end

    def internal_server_error(_error)
      http_error = Api::HttpError.new(
        status: :internal_server_error,
        message: 'Something unexpected happened'
      )

      render_error(http_error)
    end

    def render_error(http_error)
      json = { error: http_error.error_attributes }

      render(json: json, status: http_error.code) && return
    end
  end
  # rubocop:enable Metrics/BlockLength

end
