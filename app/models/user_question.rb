class UserQuestion < ActiveRecord::Base

  belongs_to :user
  belongs_to :question
  has_many :answers, through: :question
  
end
