# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

Event.create :name => "Prodigy Run"
puts "Created a race"

Event.create :name => "Chicago's Perfect 10"
puts "Created a race"

Event.create :name => "Pilgrim Pacer 5-K"
puts "Created a race"

Event.create :name => "Chicago Marathon 2012" 
puts "Created a race"

Event.create :name => "Chicago Marathon 2013"
puts "Created a race"

Event.create :name => "Freedom Half Marathon"
puts "Created a race"

Event.create :name => "Wine Vine Run Half-Marathon & 5-K"
puts "Created a race"