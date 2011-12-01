# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

Race.create :name => "Prodigy Run", 
            :city => "Chicago", 
            :race_type => "5K", 
            :race_on => "11/28/2011",
            :size => "< 3000"
puts "Created a race"

Race.create :name => "Chicago's Perfect 10", 
            :city => "Chicago", 
            :race_type => "10 Miles", 
            :race_on => "12/15/2011",
            :size => "3000-10,000"
puts "Created a race"

Race.create :name => "Pilgrim Pacer 5-K", 
            :city => "Chicago", 
            :race_type => "Full Marathon", 
            :race_on => "",
            :size => "< 3000"
puts "Created a race"


Race.create :name => "Freedom Half Marathon", 
            :city => "Chicago", 
            :race_type => "Half Marathon", 
            :race_on => "4/19/2012",
            :size => ">10,000"
puts "Created a race"


Race.create :name => "Wine Vine Run Half-Marathon & 5-K", 
            :city => "Chicago", 
            :race_type => "Half Marathon", 
            :race_on => "5/12/2012",
            :registration_on => "1/15/2012",
            :size => "< 3000"
puts "Created a race"