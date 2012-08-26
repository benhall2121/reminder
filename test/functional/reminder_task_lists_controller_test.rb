require 'test_helper'

class ReminderTaskListsControllerTest < ActionController::TestCase
  setup do
    @reminder_task_list = reminder_task_lists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reminder_task_lists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reminder_task_list" do
    assert_difference('ReminderTaskList.count') do
      post :create, :reminder_task_list => @reminder_task_list.attributes
    end

    assert_redirected_to reminder_task_list_path(assigns(:reminder_task_list))
  end

  test "should show reminder_task_list" do
    get :show, :id => @reminder_task_list.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @reminder_task_list.to_param
    assert_response :success
  end

  test "should update reminder_task_list" do
    put :update, :id => @reminder_task_list.to_param, :reminder_task_list => @reminder_task_list.attributes
    assert_redirected_to reminder_task_list_path(assigns(:reminder_task_list))
  end

  test "should destroy reminder_task_list" do
    assert_difference('ReminderTaskList.count', -1) do
      delete :destroy, :id => @reminder_task_list.to_param
    end

    assert_redirected_to reminder_task_lists_path
  end
end
