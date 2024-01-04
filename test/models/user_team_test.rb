require 'test_helper'

class UserTeamTest < ActiveSupport::TestCase
  test 'should validate the existence of the user in a UserTeam relationship' do
    non_existent_user_id = User.last.id + 1
    userteam = UserTeam.new(user_id: non_existent_user_id, team_id: teams(:DPL).id)
    assert_not userteam.valid?, 'UserTeam was marked valid with a non-existent user'
    assert_not_empty userteam.errors[:user], 'Expected an error for using a non-existent user, but none was found'
  end

  test 'should validate the existence of the team in a UserTeam relationship' do
    non_existent_team_id = Team.last.id + 1
    userteam = UserTeam.new(user_id: users(:john).id, team_id: non_existent_team_id)
    assert_not userteam.valid?, 'UserTeam was marked valid with a non-existent team'
    assert_not_empty userteam.errors[:team], 'Expected an error for using a non-existent team, but none was found'
  end

  # This test verifies that the model does not allow the creation of a UserTeam record with a user_id
  #  and team_id combination that already exists, thus enforcing the uniqueness of each user/team pairing.
  test 'should enforce the uniqueness of the User/Team relationship' do
    userteam = UserTeam.new(user_id: users(:john).id, team_id: teams(:DPL).id)
    assert_not userteam.valid?, 'UserTeam was marked valid for a duplicate user/team relationship'
    assert_not_empty userteam.errors[:team_id], "Expected a 'User relationship already exists' error for duplicate user/team relationship, but it was not found"
  end

  test 'Users can be added to multiple teams' do
    userteam = UserTeam.new(user_id: users(:john).id, team_id: teams(:Tools).id)
    assert userteam.valid?, 'User cannot be added to multiple teams'
  end
end
