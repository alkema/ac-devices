# API Authentication controller module
module Api::Authenticatable

  extend ActiveSupport::Concern

  included do
     before_action :authorize
  end

  private

  def authorize
    token = request.headers['X-API-KEY']
    AdminUser.find_by(api_auth_token: token) || raise(Api::Rescuable::InvalidToken)
  end

end
