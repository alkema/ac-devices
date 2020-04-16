# frozen_string_literal: true

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

ActiveRecord::Schema.define(version: 20_200_415_044_304) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'active_admin_comments', force: :cascade do |t|
    t.string('namespace')
    t.text('body')
    t.string('resource_type')
    t.bigint('resource_id')
    t.string('author_type')
    t.bigint('author_id')
    t.datetime('created_at', precision: 6, null: false)
    t.datetime('updated_at', precision: 6, null: false)
    t.index(%w[author_type author_id], name: 'index_active_admin_comments_on_author_type_and_author_id')
    t.index(['namespace'], name: 'index_active_admin_comments_on_namespace')
    t.index(%w[resource_type resource_id], name: 'index_active_admin_comments_on_resource_type_and_resource_id')
  end

  create_table 'admin_users', force: :cascade do |t|
    t.string('email', default: '', null: false)
    t.string('encrypted_password', default: '', null: false)
    t.string('reset_password_token')
    t.datetime('reset_password_sent_at')
    t.datetime('remember_created_at')
    t.datetime('created_at', precision: 6, null: false)
    t.datetime('updated_at', precision: 6, null: false)
    t.string('api_auth_token')
    t.index(['api_auth_token'], name: 'index_admin_users_on_api_auth_token', unique: true)
    t.index(['email'], name: 'index_admin_users_on_email', unique: true)
    t.index(['reset_password_token'], name: 'index_admin_users_on_reset_password_token', unique: true)
  end

  create_table 'device_readings', force: :cascade do |t|
    t.bigint('device_id')
    t.decimal('temperature', precision: 3, scale: 1)
    t.decimal('humidity', precision: 5, scale: 2)
    t.integer('carbon_monoxide')
    t.string('health_status')
    t.datetime('reading_at')
    t.datetime('created_at', precision: 6, null: false)
    t.datetime('updated_at', precision: 6, null: false)
    t.index(%w[device_id carbon_monoxide], name: 'index_device_readings_on_device_id_and_carbon_monoxide')
    t.index(%w[device_id health_status], name: 'index_device_readings_on_device_id_and_health_status')
    t.index(%w[device_id humidity], name: 'index_device_readings_on_device_id_and_humidity')
    t.index(%w[device_id temperature], name: 'index_device_readings_on_device_id_and_temperature')
    t.index(['device_id'], name: 'index_device_readings_on_device_id')
  end

  create_table 'devices', force: :cascade do |t|
    t.string('serial_number')
    t.string('firmware_version')
    t.date('registered_on')
    t.datetime('created_at', precision: 6, null: false)
    t.datetime('updated_at', precision: 6, null: false)
  end
end
