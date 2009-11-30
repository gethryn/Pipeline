class Building < ActiveRecord::Base
  
  has_many :floors
  #has_many :opportunities, :through => :floors
  
  validates_presence_of :name, :short_name, :state, :suburb
  validates_uniqueness_of :short_name
  
  named_scope :in_cbd, :conditions => { :building_zone => 'CBD' }  # ALELUJAH!
  named_scope :in_metro, :conditions => {:building_zone => 'Metro'}
  named_scope :avail_for_sip, :conditions => { :available_for_sip => true }
  
  def related_opportunities
    Opportunity.all.select { |opp| opp.affected_buildings.collect(&:id).include?(self.id) }
  end
  
  def opportunity_count
    self.floors.collect(&:opportunity_count).sum
  end

  def floor_list
    self.floors.collect(&:floor_list)
  end
  
  def google_map_link
    "http://maps.google.com/maps?f=q&source=s_q&hl=en&geocode=&q=#{self.name},#{self.suburb}+#{self.state},+Australia".gsub(/\s/,'+')
  end
  
  def capacity
    self.floors.collect(&:capacity).sum
  end

end
