require 'test_helper'

class GeorefsControllerTest < ActionController::TestCase
  setup do
    @georef = georefs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:georefs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create georef" do
    assert_difference('Georef.count') do
      post :create, georef: @georef.attributes
    end

    assert_redirected_to georef_path(assigns(:georef))
  end

  test "should show georef" do
    get :show, id: @georef.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @georef.to_param
    assert_response :success
  end

  test "should update georef" do
    put :update, id: @georef.to_param, georef: @georef.attributes
    assert_redirected_to georef_path(assigns(:georef))
  end

  test "should destroy georef" do
    assert_difference('Georef.count', -1) do
      delete :destroy, id: @georef.to_param
    end

    assert_redirected_to georefs_path
  end
end
