require 'test_helper'

class ReminderTasksControllerTest < ActionController::TestCase
  setup do
    @reminder_task = reminder_tasks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reminder_tasks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reminder_task" do
    assert_difference('ReminderTask.count') do
      post :create, :reminder_task => @reminder_task.attributes
    end

    assert_redirected_to reminder_task_path(assigns(:reminder_task))
  end

  test "should show reminder_task" do
    get :show, :id => @reminder_task.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @reminder_task.to_param
    assert_response :success
  end

  test "should update reminder_task" do
    put :update, :id => @reminder_task.to_param, :reminder_task => @reminder_task.attributes
    assert_redirected_to reminder_task_path(assigns(:reminder_task))
  end

  test "should destroy reminder_task" do
    assert_difference('ReminderTask.count', -1) do
      delete :destroy, :id => @reminder_task.to_param
    end

    assert_redirected_to reminder_tasks_path
  end
end
