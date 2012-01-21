# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

User.create(email: "admin@admin.com", password: "admin", password_confirmation: "admin")

first = Event.create :name => "Prodigy Run"
first.event_dates.create(name: "Regisration", date: Date.today + 20)
first.event_dates.create(name: "Race", date: Date.today + 40)
puts "Created a race"

second = Event.create :name => "Chicago's Perfect 10"
second.event_dates.create(name: "Regisration", date: Date.today + 60)
second.event_dates.create(name: "Race", date: Date.today + 80)
puts "Created a race"

third = Event.create :name => "Pilgrim Pacer 5-K"
third.event_dates.create(name: "Regisration", date: Date.today + 100)
third.event_dates.create(name: "Race", date: Date.today + 120)
puts "Created a race"

fourth = Event.create :name => "Chicago Marathon 2012" 
fourth.event_dates.create(name: "Regisration", date: Date.today + 140)
fourth.event_dates.create(name: "Race", date: Date.today + 160)
puts "Created a race"

fifth = Event.create :name => "Chicago Marathon 2013"
fifth.event_dates.create(name: "Regisration", date: Date.today + 180)
fifth.event_dates.create(name: "Race", date: Date.today + 200)
puts "Created a race"

sixth = Event.create :name => "Freedom Half Marathon"
sixth.event_dates.create(name: "Regisration", date: Date.today + 220)
sixth.event_dates.create(name: "Race", date: Date.today + 240)
puts "Created a race"

seventh = Event.create :name => "Wine Vine Run Half-Marathon & 5-K"
seventh.event_dates.create(name: "Regisration", date: Date.today + 60)
seventh.event_dates.create(name: "Race", date: Date.today + 80)
puts "Created a race"