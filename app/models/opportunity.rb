class Opportunity < ActiveRecord::Base
  
  belongs_to :floor, :counter_cache => true
  has_many :opportunity_items
  
  validates_presence_of :business_unit, :move_type, :status, :team, :est_date
  validates_numericality_of :num_seats_departing, :num_seats_arriving, :allow_nil => true
  
  def size_change?
    if ((self.num_seats_arriving.nil? == false) && (self.num_seats_departing != self.num_seats_arriving))
      return true
    end
  end
  
  def name
    "\##{self.id}: #{self.team} [#{self.business_unit}]"
  end
  
  def affected_floors
    (opportunity_items.collect(&:from_floor) + opportunity_items.collect(&:to_floor)).uniq || []
  end
  
  def affected_seats_from
    opportunity_items.collect(&:from_floor_seats).sum || 0
  end
  
  def affected_seats_to
    opportunity_items.collect(&:to_floor_seats).sum || 0
  end 
  
  
end
