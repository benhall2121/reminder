require 'test_helper'

class RemindersMainsControllerTest < ActionController::TestCase
  setup do
    @reminders_main = reminders_mains(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reminders_mains)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reminders_main" do
    assert_difference('RemindersMain.count') do
      post :create, :reminders_main => @reminders_main.attributes
    end

    assert_redirected_to reminders_main_path(assigns(:reminders_main))
  end

  test "should show reminders_main" do
    get :show, :id => @reminders_main.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @reminders_main.to_param
    assert_response :success
  end

  test "should update reminders_main" do
    put :update, :id => @reminders_main.to_param, :reminders_main => @reminders_main.attributes
    assert_redirected_to reminders_main_path(assigns(:reminders_main))
  end

  test "should destroy reminders_main" do
    assert_difference('RemindersMain.count', -1) do
      delete :destroy, :id => @reminders_main.to_param
    end

    assert_redirected_to reminders_mains_path
  end
end
