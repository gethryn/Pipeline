require 'test_helper'

class StaticItemsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:static_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create static_item" do
    assert_difference('StaticItem.count') do
      post :create, :static_item => { }
    end

    assert_redirected_to static_item_path(assigns(:static_item))
  end

  test "should show static_item" do
    get :show, :id => static_items(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => static_items(:one).to_param
    assert_response :success
  end

  test "should update static_item" do
    put :update, :id => static_items(:one).to_param, :static_item => { }
    assert_redirected_to static_item_path(assigns(:static_item))
  end

  test "should destroy static_item" do
    assert_difference('StaticItem.count', -1) do
      delete :destroy, :id => static_items(:one).to_param
    end

    assert_redirected_to static_items_path
  end
end
