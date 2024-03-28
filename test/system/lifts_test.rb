require "application_system_test_case"

class LiftsTest < ApplicationSystemTestCase
  setup do
    @lift = lifts(:one)
  end

  test "visiting the index" do
    visit lifts_url
    assert_selector "h1", text: "Lifts"
  end

  test "should create lift" do
    visit lifts_url
    click_on "New lift"

    fill_in "Cost", with: @lift.cost
    fill_in "Date", with: @lift.date
    fill_in "Destination", with: @lift.destination
    fill_in "Driver name", with: @lift.driver_name
    fill_in "Start location", with: @lift.start_location
    fill_in "Time", with: @lift.time
    click_on "Create Lift"

    assert_text "Lift was successfully created"
    click_on "Back"
  end

  test "should update Lift" do
    visit lift_url(@lift)
    click_on "Edit this lift", match: :first

    fill_in "Cost", with: @lift.cost
    fill_in "Date", with: @lift.date
    fill_in "Destination", with: @lift.destination
    fill_in "Driver name", with: @lift.driver_name
    fill_in "Start location", with: @lift.start_location
    fill_in "Time", with: @lift.time
    click_on "Update Lift"

    assert_text "Lift was successfully updated"
    click_on "Back"
  end

  test "should destroy Lift" do
    visit lift_url(@lift)
    click_on "Destroy this lift", match: :first

    assert_text "Lift was successfully destroyed"
  end
end
