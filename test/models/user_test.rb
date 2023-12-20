require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'should not save User without email' do
    user = User.new
    assert_not user.save, 'Saved the user without an email'
  end

  test 'email should be unique' do
    user = User.new(email: 'john@example.com')
    assert_not user.save, 'Saved a user with a duplicate email'
  end
end
