require "application_system_test_case"

class LeavePeriodsTest < ApplicationSystemTestCase
  setup do
    @leave_period = leave_periods(:one)
  end

  test "visiting the index" do
    visit leave_periods_url
    assert_selector "h1", text: "Leave periods"
  end

  test "should create leave period" do
    visit leave_periods_url
    click_on "New leave period"

    fill_in "End time", with: @leave_period.end_time
    fill_in "Name", with: @leave_period.name
    fill_in "Start time", with: @leave_period.start_time
    fill_in "User", with: @leave_period.user
    click_on "Create Leave period"

    assert_text "Leave period was successfully created"
    click_on "Back"
  end

  test "should update Leave period" do
    visit leave_period_url(@leave_period)
    click_on "Edit this leave period", match: :first

    fill_in "End time", with: @leave_period.end_time
    fill_in "Name", with: @leave_period.name
    fill_in "Start time", with: @leave_period.start_time
    fill_in "User", with: @leave_period.user
    click_on "Update Leave period"

    assert_text "Leave period was successfully updated"
    click_on "Back"
  end

  test "should destroy Leave period" do
    visit leave_period_url(@leave_period)
    click_on "Destroy this leave period", match: :first

    assert_text "Leave period was successfully destroyed"
  end
end
