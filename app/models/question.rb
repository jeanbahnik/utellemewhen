class Question < ActiveRecord::Base
  
  # before_save :check_if_question_is_there
  
  has_many :user_questions
  has_many :users, :through => :user_questions
  has_many :answers

  def check_if_question_is_there
    if question = Question.find_by_name(self.name)
      uq = UserQuestion.new
      uq.user = self.users.last
      uq.question = question
      uq.save
      return false
    end
  end

end
