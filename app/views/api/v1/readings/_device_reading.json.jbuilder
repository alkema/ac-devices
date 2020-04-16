# frozen_string_literal: true

json.extract!(
  device_reading,
  :id,
  :device_id,
  :temperature,
  :humidity,
  :carbon_monoxide,
  :health_status,
  :created_at,
  :updated_at,
  :reading_at
)
json.url(api_v1_reading_url(device_reading, format: :json))
