class Invitation

  include ActiveModel::Model

  attr_accessor :email

  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }

end
