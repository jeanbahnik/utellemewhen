class Answer < ActiveRecord::Base
  
  belongs_to :question
  belongs_to :event
  has_many :event_dates, through: :event
  
end
