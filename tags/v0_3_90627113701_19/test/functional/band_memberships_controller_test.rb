require 'test_helper'

class BandMembershipsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:band_memberships)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create band_membership" do
    assert_difference('BandMembership.count') do
      post :create, :band_membership => { }
    end

    assert_redirected_to band_membership_path(assigns(:band_membership))
  end

  test "should show band_membership" do
    get :show, :id => band_memberships(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => band_memberships(:one).to_param
    assert_response :success
  end

  test "should update band_membership" do
    put :update, :id => band_memberships(:one).to_param, :band_membership => { }
    assert_redirected_to band_membership_path(assigns(:band_membership))
  end

  test "should destroy band_membership" do
    assert_difference('BandMembership.count', -1) do
      delete :destroy, :id => band_memberships(:one).to_param
    end

    assert_redirected_to band_memberships_path
  end
end
