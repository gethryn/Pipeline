authorization do
  
  role :admin do
    has_permission_on [:buildings, :floors, :opportunities, :static_items, :opportunity_items], 
                      :to => [  :index, :show, :new, :create, :edit, 
                                :update, :destroy, :building_capacity_column_data]
    has_permission_on [:users], :to => [  :index, :show, :new, :create, :edit, 
                      :update, :destroy]
  end
  
  role :guest do
    includes :admin
    has_permission_on [:welcome], :to => [:index]
  end
  
  role :account_manager do
    has_permission_on [:buildings, :floors, :opportunities, :static_items, :opportunity_items], 
                      :to => [  :index, :show, :new, :create, :building_capacity_column_data]
  end
  
  role :delivery_manager do
    includes :account_manager
  end
  
  role :vendor do
    includes :guest
  end
  
  role :workplace_manager do
    includes :account_manager
    has_permission_on [:opportunities, :opportunity_items], 
                      :to => [:edit, :update]
  end

end

