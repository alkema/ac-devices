# frozen_string_literal: true

class CreateDeviceReadings < ActiveRecord::Migration[6.0]
  def change
    create_table :device_readings do |t|
      t.references(:device)
      t.decimal(:temperature, precision: 3, scale: 1)
      t.decimal(:humidity, precision: 5, scale: 2)
      t.integer(:carbon_monoxide)
      t.string(:health_status, length: 150)
      t.datetime(:reading_at)

      t.timestamps
    end

    add_index(:device_readings, %i[device_id temperature])
    add_index(:device_readings, %i[device_id humidity])
    add_index(:device_readings, %i[device_id carbon_monoxide])
    add_index(:device_readings, %i[device_id health_status])
    add_index(:device_readings, [:reading_at])
  end
end
