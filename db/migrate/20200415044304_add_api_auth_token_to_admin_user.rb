class AddApiAuthTokenToAdminUser < ActiveRecord::Migration[6.0]
  def change
    add_column :admin_users, :api_auth_token, :string
    add_index :admin_users, :api_auth_token, unique: true
  end
end
