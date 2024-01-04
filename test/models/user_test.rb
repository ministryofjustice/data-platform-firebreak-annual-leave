require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'should validate presence of email for User' do
    user = User.new
    assert_not user.valid?, 'User was marked valid without an email'
    assert_not_empty user.errors[:email], 'No validation error for missing email'
  end

  test 'should enforce uniqueness of email for User' do
    existing_user = users(:john)
    user = User.new(email: existing_user.email)
    assert_not user.valid?, 'User was marked valid with a duplicate email'
    assert_includes user.errors[:email], 'has already been taken', 'Expected a uniqueness error for email, but it was not found'
  end
end
