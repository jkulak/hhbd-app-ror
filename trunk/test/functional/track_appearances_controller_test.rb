require 'test_helper'

class TrackAppearancesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:track_appearances)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create track_appearance" do
    assert_difference('TrackAppearance.count') do
      post :create, :track_appearance => { }
    end

    assert_redirected_to track_appearance_path(assigns(:track_appearance))
  end

  test "should show track_appearance" do
    get :show, :id => track_appearances(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => track_appearances(:one).to_param
    assert_response :success
  end

  test "should update track_appearance" do
    put :update, :id => track_appearances(:one).to_param, :track_appearance => { }
    assert_redirected_to track_appearance_path(assigns(:track_appearance))
  end

  test "should destroy track_appearance" do
    assert_difference('TrackAppearance.count', -1) do
      delete :destroy, :id => track_appearances(:one).to_param
    end

    assert_redirected_to track_appearances_path
  end
end
