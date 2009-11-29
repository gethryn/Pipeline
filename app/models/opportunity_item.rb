class OpportunityItem < ActiveRecord::Base
  belongs_to :opportunity
  
  validates_presence_of :from_floor_id, :from_floor_seats, :cost_centre, :team_name, :contact_name
  validates_format_of :cost_centre, :with => /^([a-zA_Z0-9]{6})$/, :message => "must be 6 alphanumeric characters."
  
end
