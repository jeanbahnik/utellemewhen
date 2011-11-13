module RacesHelper
  
  def get_cities
    races = Race.all
    
    cities = races.collect { |race| race.city if !race.city.blank? }
    
    cities.sort!.uniq!
    
    cities.unshift(["All",nil])
  end 
  
  def get_categories
    races = Race.all
    
    rTypes = races.collect { |race| race.race_type if !race.race_type.blank? }
    
    
    rTypes.uniq!
    
    rTypes.unshift(["All",nil])
    
  end
  
  def get_sizes
    races = Race.all
    
    sizes = races.collect { |race| race.size if !race.size.blank?}
    
    sizes.uniq!
    
    sizes.unshift(["All",nil])
  end
end
