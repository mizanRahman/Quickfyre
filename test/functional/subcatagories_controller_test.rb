require 'test_helper'

class SubcatagoriesControllerTest < ActionController::TestCase
  setup do
    @subcatagory = subcatagories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:subcatagories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create subcatagory" do
    assert_difference('Subcatagory.count') do
      post :create, subcatagory: @subcatagory.attributes
    end

    assert_redirected_to subcatagory_path(assigns(:subcatagory))
  end

  test "should show subcatagory" do
    get :show, id: @subcatagory
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @subcatagory
    assert_response :success
  end

  test "should update subcatagory" do
    put :update, id: @subcatagory, subcatagory: @subcatagory.attributes
    assert_redirected_to subcatagory_path(assigns(:subcatagory))
  end

  test "should destroy subcatagory" do
    assert_difference('Subcatagory.count', -1) do
      delete :destroy, id: @subcatagory
    end

    assert_redirected_to subcatagories_path
  end
end
