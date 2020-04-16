# frozen_string_literal: true

class Device < ApplicationRecord
  has_many :device_readings

  validates :serial_number, :firmware_version, :registered_on, presence: true
end
