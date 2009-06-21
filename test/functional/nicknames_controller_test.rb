require 'test_helper'

class NicknamesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:nicknames)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create nickname" do
    assert_difference('Nickname.count') do
      post :create, :nickname => { }
    end

    assert_redirected_to nickname_path(assigns(:nickname))
  end

  test "should show nickname" do
    get :show, :id => nicknames(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => nicknames(:one).to_param
    assert_response :success
  end

  test "should update nickname" do
    put :update, :id => nicknames(:one).to_param, :nickname => { }
    assert_redirected_to nickname_path(assigns(:nickname))
  end

  test "should destroy nickname" do
    assert_difference('Nickname.count', -1) do
      delete :destroy, :id => nicknames(:one).to_param
    end

    assert_redirected_to nicknames_path
  end
end
