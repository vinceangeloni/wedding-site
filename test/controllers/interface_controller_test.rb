require 'test_helper'

class InterfaceControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get story" do
    get :story
    assert_response :success
  end

  test "should get details" do
    get :details
    assert_response :success
  end

  test "should get rsvp" do
    get :rsvp
    assert_response :success
  end

  test "should get registry" do
    get :registry
    assert_response :success
  end

end
