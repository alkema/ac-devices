class Devices < ActiveRecord::Migration[6.0]
  def change
    create_table :devices do |t|
      t.string :serial_number
      t.string :firmware_version
      t.date :registered_on

      t.timestamps
    end
  end
end
