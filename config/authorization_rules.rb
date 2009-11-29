authorization do
  role :admin do
    has_permission_on [:buildings, :floors, :opportunities, :static_items], 
                      :to => [  :index, :show, :new, :create, :edit, 
                                :update, :destroy, :building_capacity_column_data] 
  end
  
  role :guest do
    includes :admin
    has_permission_on [:welcome], :to => [:index]
  end
  
  role :author do
    has_permission_on [:buildings, :floors, :opportunities, :static_items], 
                      :to => [  :index, :show, :new, :create, :building_capacity_column_data]
  end
  
  role :moderator do
    includes :author
    has_permission_on [:opportunities], 
                      :to => [:edit, :update]
  end

end