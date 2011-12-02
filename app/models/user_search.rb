class UserSearch < ActiveRecord::Base
  
  belongs_to :user
  
  def name
    name.try(:name)
  end

  def name=(name)
    self.race_name = Race.find_or_create_by_name(name) if name.present?
  end
  
end
