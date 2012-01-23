class EventDate < ActiveRecord::Base
  
  belongs_to :event
  
  def days_left
    days_left = (date.to_datetime - DateTime.now).to_i
  end
  
end
