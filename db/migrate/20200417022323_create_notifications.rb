class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.references :device_reading
      t.string :warning_type
      t.boolean :resolved, null: false, default: false

      t.timestamps
    end
  end
end
