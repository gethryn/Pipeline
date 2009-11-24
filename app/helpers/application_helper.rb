# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def get_img_or_colour(listname,listitem)
    StaticItem.find(:first, :conditions => {:list_name => listname, :list_item => listitem}).list_img
  end
  def get_yaml_item(listname,listitem)
    APP_CONFIG[listname][listitem] || ""
  end
  def get_yaml_keys(listname)
    APP_CONFIG[listname].keys.sort || []
  end
  def get_building_from_short_name(shortname)
    Building.find_by_short_name(shortname)
  end
  def get_building_short_name_with_floor(floor)
    Floor.find(floor).building_short_name_with_floor 
  end
end