class Building < ActiveRecord::Base
  
  has_many :floors
  has_many :opportunities, :through => :floors
  
  validates_presence_of :name, :short_name, :state, :suburb
  validates_uniqueness_of :short_name
  
  def opportunity_count
    self.floors.collect(&:opportunity_count).sum
  end

  def floor_list
    #Floor.find(:all, :conditions => {:building_id => self.id}).collect { |flr| flr.floor_level }
    self.floors.collect(&:floor_list)
  end
  
  def google_map_link
    "http://maps.google.com/maps?f=q&source=s_q&hl=en&geocode=&q=#{self.name},#{self.suburb}+#{self.state},+Australia".gsub(/\s/,'+')
  end
  
  def capacity
    self.floors.collect(&:capacity).sum
  end

end
