require "test_helper"

class LiftsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lift = lifts(:one)
  end

  test "should get index" do
    get lifts_url
    assert_response :success
  end

  test "should get new" do
    get new_lift_url
    assert_response :success
  end

  test "should create lift" do
    assert_difference("Lift.count") do
      post lifts_url, params: { lift: { cost: @lift.cost, date: @lift.date, destination: @lift.destination, driver_name: @lift.driver_name, start_location: @lift.start_location, time: @lift.time } }
    end

    assert_redirected_to lift_url(Lift.last)
  end

  test "should show lift" do
    get lift_url(@lift)
    assert_response :success
  end

  test "should get edit" do
    get edit_lift_url(@lift)
    assert_response :success
  end

  test "should update lift" do
    patch lift_url(@lift), params: { lift: { cost: @lift.cost, date: @lift.date, destination: @lift.destination, driver_name: @lift.driver_name, start_location: @lift.start_location, time: @lift.time } }
    assert_redirected_to lift_url(@lift)
  end

  test "should destroy lift" do
    assert_difference("Lift.count", -1) do
      delete lift_url(@lift)
    end

    assert_redirected_to lifts_url
  end
end
