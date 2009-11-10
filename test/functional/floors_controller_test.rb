require 'test_helper'

class FloorsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:floors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create floor" do
    assert_difference('Floor.count') do
      post :create, :floor => { }
    end

    assert_redirected_to floor_path(assigns(:floor))
  end

  test "should show floor" do
    get :show, :id => floors(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => floors(:one).to_param
    assert_response :success
  end

  test "should update floor" do
    put :update, :id => floors(:one).to_param, :floor => { }
    assert_redirected_to floor_path(assigns(:floor))
  end

  test "should destroy floor" do
    assert_difference('Floor.count', -1) do
      delete :destroy, :id => floors(:one).to_param
    end

    assert_redirected_to floors_path
  end
end
