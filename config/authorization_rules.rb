authorization do
  role :admin do
    has_permission_on [:buildings, :floors, :opportunities, :static_items, :opportunity_items], 
                      :to => [  :index, :show, :new, :create, :edit, 
                                :update, :destroy, :building_capacity_column_data] 
  end
  
  role :guest do
    has_permission_on [:welcome], :to => [:index]
  end
  
  role :author do
    has_permission_on [:buildings, :floors, :opportunities, :static_items, :opportunity_items], 
                      :to => [  :index, :show, :new, :create, :building_capacity_column_data]
  end
  
  role :moderator do
    includes :author
    has_permission_on [:opportunities, :opportunity_items], 
                      :to => [:edit, :update]
  end

end