# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# AdminUser.create!(email: 'jody@alkema.ca', password: 'password', password_confirmation: 'password') if Rails.env.development?

device = Device.last

start = 1.day.ago
stop  = Time.zone.now

(start.to_i..stop.to_i).step(1.minute).each do |reading_at|
  DeviceReading.create(
    device: device,
    temperature: 40.upto(50).to_a.sample,
    humidity: 20.upto(80).to_a.sample,
    carbon_monoxide: 1.upto(10).to_a.sample,
    health_status: ['fair', 'good', 'bad'].sample,
    reading_at: DateTime.strptime(reading_at.to_s,'%s')
  )
end
