require 'test_helper'

class OpportunityItemsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    OpportunityItem.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    OpportunityItem.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to opportunity_items_url
  end
  
  def test_edit
    get :edit, :id => OpportunityItem.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    OpportunityItem.any_instance.stubs(:valid?).returns(false)
    put :update, :id => OpportunityItem.first
    assert_template 'edit'
  end
  
  def test_update_valid
    OpportunityItem.any_instance.stubs(:valid?).returns(true)
    put :update, :id => OpportunityItem.first
    assert_redirected_to opportunity_items_url
  end
  
  def test_destroy
    opportunity_item = OpportunityItem.first
    delete :destroy, :id => opportunity_item
    assert_redirected_to opportunity_items_url
    assert !OpportunityItem.exists?(opportunity_item.id)
  end
end
