require "test_helper"

class LeavePeriodsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @leave_period = leave_periods(:one)
  end

  test "should get index" do
    get leave_periods_url
    assert_response :success
  end

  test "should get new" do
    get new_leave_period_url
    assert_response :success
  end

  test "should create leave_period" do
    assert_difference("LeavePeriod.count") do
      post leave_periods_url, params: { leave_period: { end_time: @leave_period.end_time, name: @leave_period.name, start_time: @leave_period.start_time, user: @leave_period.user } }
    end

    assert_redirected_to leave_period_url(LeavePeriod.last)
  end

  test "should show leave_period" do
    get leave_period_url(@leave_period)
    assert_response :success
  end

  test "should get edit" do
    get edit_leave_period_url(@leave_period)
    assert_response :success
  end

  test "should update leave_period" do
    patch leave_period_url(@leave_period), params: { leave_period: { end_time: @leave_period.end_time, name: @leave_period.name, start_time: @leave_period.start_time, user: @leave_period.user } }
    assert_redirected_to leave_period_url(@leave_period)
  end

  test "should destroy leave_period" do
    assert_difference("LeavePeriod.count", -1) do
      delete leave_period_url(@leave_period)
    end

    assert_redirected_to leave_periods_url
  end
end
