require "test_helper"

class LeaveRecordsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:john)
    sign_in @user
    @leave_record = leave_records(:johns_leave)
  end

  test "should get new" do
    get new_leave_record_url
    assert_response :success
  end

  test "should create leave_record with valid parameters" do
    assert_difference('LeaveRecord.count') do
      post leave_records_url, params: { leave_record: { user_id: @user.id, start_date: '2023-03-01', end_date: '2023-03-10' } }
    end
  
    assert_redirected_to leave_record_path(LeaveRecord.last)
  end
  
  test "should not create leave_record with invalid parameters" do
    assert_no_difference('LeaveRecord.count') do
      post leave_records_url, params: { leave_record: { user_id: @user.id, start_date: '2023-03-10', end_date: '2023-03-01' } } # end_date before start_date
    end
  
    assert_response :unprocessable_entity
  end

  test "should show leave_record" do
    get leave_record_url(@leave_record)
    assert_response :success
  end

  test "should return error message for invalid leave_record" do
    post leave_records_url, params: { leave_record: { user_id: @user.id, start_date: '2023-03-10', end_date: '2023-03-01' } }
    assert_match /must be after the start date/, response.body
  end

  test "should not create overlapping leave_record" do
    existing_leave = leave_records(:johns_leave)
    overlapping_leave_params = { user_id: @user.id, start_date: existing_leave.start_date, end_date: existing_leave.end_date }
  
    assert_no_difference('LeaveRecord.count') do
      post leave_records_url, params: { leave_record: overlapping_leave_params }
    end
  
    # Assuming your application responds with :unprocessable_entity for validation failures
    assert_response :unprocessable_entity
  end

  test "should not allow user to see another user's leave_record" do
    other_user_leave_record = leave_records(:janes_leave)
    get leave_record_url(other_user_leave_record)
    assert_redirected_to "/"
  end
end
