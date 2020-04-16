# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_04_16_164957) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "api_auth_token"
    t.string "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer "invitation_limit"
    t.string "invited_by_type"
    t.bigint "invited_by_id"
    t.integer "invitations_count", default: 0
    t.index ["api_auth_token"], name: "index_admin_users_on_api_auth_token", unique: true
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["invitation_token"], name: "index_admin_users_on_invitation_token", unique: true
    t.index ["invitations_count"], name: "index_admin_users_on_invitations_count"
    t.index ["invited_by_id"], name: "index_admin_users_on_invited_by_id"
    t.index ["invited_by_type", "invited_by_id"], name: "index_admin_users_on_invited_by_type_and_invited_by_id"
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "device_readings", force: :cascade do |t|
    t.bigint "device_id"
    t.decimal "temperature", precision: 3, scale: 1
    t.decimal "humidity", precision: 5, scale: 2
    t.integer "carbon_monoxide"
    t.string "health_status"
    t.datetime "reading_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["device_id", "carbon_monoxide"], name: "index_device_readings_on_device_id_and_carbon_monoxide"
    t.index ["device_id", "health_status"], name: "index_device_readings_on_device_id_and_health_status"
    t.index ["device_id", "humidity"], name: "index_device_readings_on_device_id_and_humidity"
    t.index ["device_id", "temperature"], name: "index_device_readings_on_device_id_and_temperature"
    t.index ["device_id"], name: "index_device_readings_on_device_id"
    t.index ["reading_at"], name: "index_device_readings_on_reading_at"
  end

  create_table "devices", force: :cascade do |t|
    t.string "serial_number"
    t.string "firmware_version"
    t.date "registered_on"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
