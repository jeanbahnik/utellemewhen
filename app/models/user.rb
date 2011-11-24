class User < ActiveRecord::Base

  has_secure_password
  has_many :user_races
  has_many :races, :through => :user_races
  has_many :user_searches
  
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
  validates_uniqueness_of :email
  validates_presence_of :email
  
end