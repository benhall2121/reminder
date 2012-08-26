require 'test_helper'

class ReminderMessagesControllerTest < ActionController::TestCase
  setup do
    @reminder_message = reminder_messages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reminder_messages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reminder_message" do
    assert_difference('ReminderMessage.count') do
      post :create, :reminder_message => @reminder_message.attributes
    end

    assert_redirected_to reminder_message_path(assigns(:reminder_message))
  end

  test "should show reminder_message" do
    get :show, :id => @reminder_message.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @reminder_message.to_param
    assert_response :success
  end

  test "should update reminder_message" do
    put :update, :id => @reminder_message.to_param, :reminder_message => @reminder_message.attributes
    assert_redirected_to reminder_message_path(assigns(:reminder_message))
  end

  test "should destroy reminder_message" do
    assert_difference('ReminderMessage.count', -1) do
      delete :destroy, :id => @reminder_message.to_param
    end

    assert_redirected_to reminder_messages_path
  end
end
