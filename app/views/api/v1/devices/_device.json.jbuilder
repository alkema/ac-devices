json.extract! device, :id, :serial_number, :firmware_version, :registered_on, :created_at,
  :updated_at
json.url api_v1_device_url(device, format: :json)
