class Floor < ActiveRecord::Base
  
  belongs_to :building , :counter_cache => true
  has_many :opportunities
  has_many :exit_opportunity_items, :class_name => "OpportunityItem", :foreign_key => "from_floor_id"
  has_many :entry_opportunity_items, :class_name => "OpportunityItem", :foreign_key => "to_floor_id"
  
  validates_presence_of :floor_level
  validates_length_of :floor_level, :within => 1..3
  validates_numericality_of :capacity, :min => 0
  validates_format_of :floor_level, :with => /^(L\d{2}|[UL]?G|M|B[1-9])$/, :on => :create, :message => "is not in the required format, B9-B1, LG, G, UG, M, L00-L99"
  
  def building_short_name_with_floor
    "#{self.building.short_name} - #{self.floor_level}"
  end
  
  def building_short_name
    #Building.find(self.building_id).short_name
    self.building.short_name
  end
  
  def opportunity_count
    #Opportunity.find(:all, :conditions => { :floor_id => self.id }).count
    self.opportunities.size
  end

end