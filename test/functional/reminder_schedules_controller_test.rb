require 'test_helper'

class ReminderSchedulesControllerTest < ActionController::TestCase
  setup do
    @reminder_schedule = reminder_schedules(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reminder_schedules)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reminder_schedule" do
    assert_difference('ReminderSchedule.count') do
      post :create, :reminder_schedule => @reminder_schedule.attributes
    end

    assert_redirected_to reminder_schedule_path(assigns(:reminder_schedule))
  end

  test "should show reminder_schedule" do
    get :show, :id => @reminder_schedule.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @reminder_schedule.to_param
    assert_response :success
  end

  test "should update reminder_schedule" do
    put :update, :id => @reminder_schedule.to_param, :reminder_schedule => @reminder_schedule.attributes
    assert_redirected_to reminder_schedule_path(assigns(:reminder_schedule))
  end

  test "should destroy reminder_schedule" do
    assert_difference('ReminderSchedule.count', -1) do
      delete :destroy, :id => @reminder_schedule.to_param
    end

    assert_redirected_to reminder_schedules_path
  end
end
