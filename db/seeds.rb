# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


daily_contracts = []
daily_contracts << DailyContract.new(day: 1, start_time: Time.zone.now.change(hour: 19) , end_time: Time.zone.now.change(hour: 23))
daily_contracts << DailyContract.new(day: 2, start_time: Time.zone.now.change(hour: 19) , end_time: Time.zone.now.change(hour: 23))
daily_contracts << DailyContract.new(day: 3, start_time: Time.zone.now.change(hour: 19) , end_time: Time.zone.now.change(hour: 23))
daily_contracts << DailyContract.new(day: 4, start_time: Time.zone.now.change(hour: 19) , end_time: Time.zone.now.change(hour: 23))
daily_contracts << DailyContract.new(day: 5, start_time: Time.zone.now.change(hour: 19) , end_time: Time.zone.now.change(hour: 23))
daily_contracts << DailyContract.new(day: 6, start_time: Time.zone.now.change(hour: 10) , end_time: Time.zone.now.change(hour: 23))
daily_contracts << DailyContract.new(day: 7, start_time: Time.zone.now.change(hour: 10) , end_time: Time.zone.now.change(hour: 23))

Contracts::PlaceCreate.call(
  daily_contracts: daily_contracts,
  service_name: 'Recorrido'
)

daily_contracts = []
daily_contracts << DailyContract.new(day: 1, start_time: Time.zone.now.change(hour: 19) , end_time: Time.zone.now.change(hour: 23))
daily_contracts << DailyContract.new(day: 2, start_time: Time.zone.now.change(hour: 19) , end_time: Time.zone.now.change(hour: 23))
daily_contracts << DailyContract.new(day: 3, start_time: Time.zone.now.change(hour: 19) , end_time: Time.zone.now.change(hour: 23))
daily_contracts << DailyContract.new(day: 4, start_time: Time.zone.now.change(hour: 19) , end_time: Time.zone.now.change(hour: 23))
daily_contracts << DailyContract.new(day: 5, start_time: Time.zone.now.change(hour: 19) , end_time: Time.zone.now.change(hour: 23))
daily_contracts << DailyContract.new(day: 6, start_time: Time.zone.now.change(hour: 20) , end_time: Time.zone.now.change(hour: 23))
daily_contracts << DailyContract.new(day: 7, start_time: Time.zone.now.change(hour: 20) , end_time: Time.zone.now.change(hour: 23))


Contracts::PlaceCreate.call(
  daily_contracts: daily_contracts,
  service_name: 'Recorrido II'
)

User.create(name: 'Bárbara', color: 'red')
User.create(name: 'Benjamín', color: 'blue')
User.create(name: 'Ernesto', color: 'peru')
