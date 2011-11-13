# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

User.destroy_all
User.create :email => "Ryan.J.Naughton@gmail.com", 
            :first_name => "Cookie", 
            :last_name => "Monster", 
            :password => "cookies", :password_confirmation => "cookies"
puts "Created a user: email => '#{User.first.email}', password => 'cookies'"

User.create :email => "RNaughton@gmail.com", 
            :first_name => "Master", 
            :last_name => "Control Program", 
            :password => "MCP", :password_confirmation => "MCP",
            :admin => true
puts "Created a user"


Race.destroy_all
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

UserSearch.destroy_all

UserSearch.create :name => "Chicago Marathon"
                  :start_on => "4/29/2012",
                  :end_on => "6/30/2012",
                  :user_id => User.first.id,
                  :city => "Chicago",
                  :category => "Half Marathon",
                  :size => "< 3000"

UserSearch.create :start_on => "12/15/2011",
                  :end_on => "12/31/2011",
                  :user_id => User.first.id,
                  :city => "Chicago",
                  :category => "10 Miles",
                  :size => "3000-10,000"
                  
UserSearch.create :start_on => "11/01/2011",
                  :end_on => "11/01/2012",
                  :user_id => User.first.id,
                  :city => "Chicago",
                  :category => "Half Marathon",
                  :size => "< 3000"

UserSearch.create :start_on => "1/1/2012",
                  :end_on => "6/30/2012",
                  :user_id => User.first.id,
                  :city => "Chicago",
                  :category => "Half Marathon",
                  :size => "< 3000"

UserSearch.create :start_on => "1/1/2012",
                  :end_on => "5/1/2012",
                  :user_id => User.first.id,
                  :city => "Chicago",
                  :category => "10 Miles",
                  :size => "3000-10,000"

UserSearch.create :name => "Chicago Marathon"
                  :start_on => "12/01/2011",
                  :end_on => "12/31/2012",
                  :user_id => User.first.id,
                  :city => "Chicago",
                  :category => "",
                  :size => ""

UserSearch.create :start_on => "3/1/2012",
                  :end_on => "4/1/2012",
                  :user_id => User.last.id,
                  :city => "Chicago",
                  :category => "10 Miles",
                  :size => "3000-10,000"

UserSearch.create :start_on => "1/1/2011",
                  :end_on => "1/1/2013",
                  :user_id => User.last.id,
                  :city => "Chicago",
                  :category => "",
                  :size => "< 3000"

UserSearch.create :start_on => "",
                  :end_on => "",
                  :user_id => User.last.id,
                  :city => "Chicago",
                  :category => "Half Marathon",
                  :size => ">10,000"

UserSearch.create :start_on => "",
                  :end_on => "",
                  :user_id => User.last.id,
                  :city => "Chicago",
                  :category => "Full Marathon",
                  :size => "< 3000"

