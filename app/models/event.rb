class Event < ActiveRecord::Base
  
  after_save :create_question
  
  has_many :answers
  has_many :questions, through: :answers
  has_many :event_dates
  
  accepts_nested_attributes_for :event_dates  
  
  def create_question
    question = Question.create(name: self.name)
    answer = Answer.new
    answer.question = question
    answer.event = self
    answer.save
  end
  
end