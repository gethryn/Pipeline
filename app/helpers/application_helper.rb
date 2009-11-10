# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def get_img_or_colour(listname,listitem)
    StaticItem.find(:first, :conditions => {:list_name => listname, :list_item => listitem}).list_img
  end
end
