require 'test_helper'

class LeaveRecordTest < ActiveSupport::TestCase
  setup do
    @user = users(:john)
    @existing_leave = LeaveRecord.create(user: @user, start_date: '2023-01-01', end_date: '2023-01-10')
    LeaveRecord.create(user: @user, start_date: '2023-01-01', end_date: '2023-01-05') # 4 weekdays, 1 weekend days
    LeaveRecord.create(user: @user, start_date: '2023-02-01', end_date: '2023-02-03') # 3 weekdays
    LeaveRecord.create(user: @user, start_date: '2023-03-10', end_date: '2023-03-15') # 4 weekdays, 2 weekend days
    # Total = 11 days (some weekends)
  end

  test 'should not save LeaveRecord without required attributes' do
    leave_record = LeaveRecord.new
    assert_not leave_record.save, 'Saved the leave_record without required attributes'
  end

  test 'should belong to user' do
    leave_record = leave_records(:johns_leave)
    assert_equal users(:john), leave_record.user
  end

  test 'end_date should be after start_date' do
    leave_record = leave_records(:johns_leave)
    assert leave_record.end_date > leave_record.start_date, 'end_date is not after start_date'
  end

  test 'should not allow overlapping leave records for the same user' do
    overlapping_leave = LeaveRecord.new(user: users(:john), start_date: '2023-01-05', end_date: '2023-01-15')
    assert_not overlapping_leave.save, 'Saved overlapping leave records for the same user'
  end

  test 'should not allow leave records that partially overlap with existing leave' do
    overlapping_leave = LeaveRecord.new(user: users(:john), start_date: '2023-01-09', end_date: '2023-01-20')
    assert_not overlapping_leave.valid?, 'Allowed overlapping leave (partial overlap)'
  end

  test 'should not allow leave records that entirely encompass existing leave' do
    overlapping_leave = LeaveRecord.new(user: users(:john), start_date: '2022-12-31', end_date: '2023-01-11')
    assert_not overlapping_leave.valid?, 'Allowed overlapping leave (full encompass)'
  end

  test 'used_leave should return correct total weekdays of leave' do
    assert_equal 11, @user.used_leave, 'used_leave did not return the correct total weekdays of leave'
  end
end
