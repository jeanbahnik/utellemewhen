class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  # attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :registered, :email_token
  # This is used to pull in the validators found in 'app/validators/'
  include ActiveModel::Validations

  has_secure_password
  has_many :user_races
  has_many :races, :through => :user_races
  has_many :user_questions
  has_many :questions, :through => :user_questions
  
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
  validates_uniqueness_of :email
  validates_presence_of :email
  
  # custom validator 
  validates_with RegisteredValidator, :on => :update

end
