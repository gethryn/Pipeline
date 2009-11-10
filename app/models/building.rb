class Building < ActiveRecord::Base
  
  has_many :floors
  has_many :opportunities, :through => :floors
  
  validates_presence_of :name, :short_name, :state, :suburb
  validates_uniqueness_of :short_name
  
  def opportunity_count
    Opportunity.find(:all, :joins => :floor, :conditions => "floors.building_id = #{self.id}").size
  end

  def capacity
    @f = Floor.find(:all, :conditions => {:building_id => self.id}).collect { |flr| flr.capacity }
    @f.inject {|sum,item| sum + item }
  end
  
  def floor_list
    Floor.find(:all, :conditions => {:building_id => self.id}).collect { |flr| flr.floor_level }
  end
  
  def google_map_link
    "http://maps.google.com/maps?f=q&source=s_q&hl=en&geocode=&q=#{self.name},#{self.suburb}+#{self.state},+Australia".gsub(/\s/,'+')
  end

end
