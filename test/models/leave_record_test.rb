require "test_helper"

class LeaveRecordTest < ActiveSupport::TestCase
  test "should not save LeaveRecord without required attributes" do
    leave_record = LeaveRecord.new
    assert_not leave_record.save, "Saved the leave_record without required attributes"
  end

  test "should belong to user" do
    leave_record = leave_records(:johns_leave)
    assert_equal users(:john), leave_record.user
  end

  test "end_date should be after start_date" do
    leave_record = leave_records(:johns_leave)
    assert leave_record.end_date > leave_record.start_date, "end_date is not after start_date"
  end

  test "should not allow overlapping leave records for the same user" do
    overlapping_leave = LeaveRecord.new(user: users(:john), start_date: '2023-01-05', end_date: '2023-01-15')
    assert_not overlapping_leave.save, "Saved overlapping leave records for the same user"
  end
end
