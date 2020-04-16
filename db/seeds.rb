[
  {
    'serial_number': 'B082PZAZC05270R',
    'firmware_version': '1.333.9999.9',
    'registered_on': Date.today
  },
  {
    'serial_number': 'B082PZAZC05270T',
    'firmware_version': '1.333.9999.9',
    'registered_on': Date.today
  },
  {
    'serial_number': 'B082PZAZC05270N',
    'firmware_version': '1.333.9999.9',
    'registered_on': Date.today
  },
  {
    'serial_number': 'B082PZAZC05270M',
    'firmware_version': '1.333.9999.10',
    'registered_on': Date.today
  }
].each do |device_atts|
  Device.create!(device_atts)
end

def batch_create_readings(device)
  start = 2.months.ago
  stop = Time.zone.now

  (start.to_i..stop.to_i).step(1.minute).each do |reading_at|
    DeviceReading.create(
      device: device,
      temperature: 40.upto(50).to_a.sample,
      humidity: 60.upto(80).to_a.sample,
      carbon_monoxide: 1.upto(10).to_a.sample,
      health_status: 'good',
      reading_at: DateTime.strptime(reading_at.to_s,'%s')
    )
  end
end

Device.all.each do |device|
  batch_create_readings(device)
end
