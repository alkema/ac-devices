# frozen_string_literal: true

# Simple relation to store time series in the prototype
# Likely will be better stored in a time series storage engine for production such as:
#   * https://aws.amazon.com/timestream/
#   * https://en.wikipedia.org/wiki/InfluxDB
#   * https://github.com/timescale/timescaledb
class DeviceReading < ApplicationRecord
  belongs_to :device

  scope :this_week, -> { where('extract(week from reading_at) = ?', Date.current.cweek) }

  scope :this_month, -> { where('extract(month from reading_at) = ?', Date.current.month) }

  scope :this_year, -> { where('extract(year from reading_at) = ?', Date.current.year) }
end
