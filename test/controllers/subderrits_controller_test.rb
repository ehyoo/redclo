require 'test_helper'

class SubderritsControllerTest < ActionController::TestCase
  setup do
    @subderrit = subderrits(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:subderrits)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create subderrit" do
    assert_difference('Subderrit.count') do
      post :create, subderrit: { name: @subderrit.name }
    end

    assert_redirected_to subderrit_path(assigns(:subderrit))
  end

  test "should show subderrit" do
    get :show, id: @subderrit
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @subderrit
    assert_response :success
  end

  test "should update subderrit" do
    patch :update, id: @subderrit, subderrit: { name: @subderrit.name }
    assert_redirected_to subderrit_path(assigns(:subderrit))
  end

  test "should destroy subderrit" do
    assert_difference('Subderrit.count', -1) do
      delete :destroy, id: @subderrit
    end

    assert_redirected_to subderrits_path
  end
end
