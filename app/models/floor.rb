class Floor < ActiveRecord::Base
  
  belongs_to :building , :counter_cache => true
  has_many :opportunities
  
  validates_presence_of :floor_level
  validates_length_of :floor_level, :within => 1..3
  validates_numericality_of :capacity, :min => 0
  
  def building_short_name_with_floor
    "#{Building.find(self.building_id).short_name} - #{self.floor_level}"
  end
  
  def building_short_name
    Building.find(self.building_id).short_name
  end
  
  def opportunity_count
    Opportunity.find(:all, :conditions => { :floor_id => self.id }).count
  end

end