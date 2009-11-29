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
  
end
