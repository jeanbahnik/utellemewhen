class Event < ActiveRecord::Base
  
  has_many :questions, :through => :answers
  has_many :event_dates
  
end