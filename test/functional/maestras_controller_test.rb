require 'test_helper'

class MaestrasControllerTest < ActionController::TestCase
  setup do
    @maestra = maestras(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:maestras)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create maestra" do
    assert_difference('Maestra.count') do
      post :create, maestra: @maestra.attributes
    end

    assert_redirected_to maestra_path(assigns(:maestra))
  end

  test "should show maestra" do
    get :show, id: @maestra.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @maestra.to_param
    assert_response :success
  end

  test "should update maestra" do
    put :update, id: @maestra.to_param, maestra: @maestra.attributes
    assert_redirected_to maestra_path(assigns(:maestra))
  end

  test "should destroy maestra" do
    assert_difference('Maestra.count', -1) do
      delete :destroy, id: @maestra.to_param
    end

    assert_redirected_to maestras_path
  end
end
