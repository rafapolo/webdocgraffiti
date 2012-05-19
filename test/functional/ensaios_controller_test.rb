require 'test_helper'

class EnsaiosControllerTest < ActionController::TestCase
  setup do
    @ensaio = ensaios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ensaios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ensaio" do
    assert_difference('Ensaio.count') do
      post :create, ensaio: @ensaio.attributes
    end

    assert_redirected_to ensaio_path(assigns(:ensaio))
  end

  test "should show ensaio" do
    get :show, id: @ensaio.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ensaio.to_param
    assert_response :success
  end

  test "should update ensaio" do
    put :update, id: @ensaio.to_param, ensaio: @ensaio.attributes
    assert_redirected_to ensaio_path(assigns(:ensaio))
  end

  test "should destroy ensaio" do
    assert_difference('Ensaio.count', -1) do
      delete :destroy, id: @ensaio.to_param
    end

    assert_redirected_to ensaios_path
  end
end
