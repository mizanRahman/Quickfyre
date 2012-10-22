require 'test_helper'

class LaccountsControllerTest < ActionController::TestCase
  setup do
    @laccount = laccounts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:laccounts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create laccount" do
    assert_difference('Laccount.count') do
      post :create, laccount: @laccount.attributes
    end

    assert_redirected_to laccount_path(assigns(:laccount))
  end

  test "should show laccount" do
    get :show, id: @laccount
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @laccount
    assert_response :success
  end

  test "should update laccount" do
    put :update, id: @laccount, laccount: @laccount.attributes
    assert_redirected_to laccount_path(assigns(:laccount))
  end

  test "should destroy laccount" do
    assert_difference('Laccount.count', -1) do
      delete :destroy, id: @laccount
    end

    assert_redirected_to laccounts_path
  end
end
