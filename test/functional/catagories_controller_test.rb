require 'test_helper'

class CatagoriesControllerTest < ActionController::TestCase
  setup do
    @catagory = catagories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:catagories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create catagory" do
    assert_difference('Catagory.count') do
      post :create, catagory: @catagory.attributes
    end

    assert_redirected_to catagory_path(assigns(:catagory))
  end

  test "should show catagory" do
    get :show, id: @catagory
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @catagory
    assert_response :success
  end

  test "should update catagory" do
    put :update, id: @catagory, catagory: @catagory.attributes
    assert_redirected_to catagory_path(assigns(:catagory))
  end

  test "should destroy catagory" do
    assert_difference('Catagory.count', -1) do
      delete :destroy, id: @catagory
    end

    assert_redirected_to catagories_path
  end
end
