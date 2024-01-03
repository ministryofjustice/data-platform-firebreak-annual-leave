require 'test_helper'

class UserTeamTest < ActiveSupport::TestCase
  setup do
    UserTeam.create(user_id: users(:john).id, team_id: teams(:DPL).id)
    UserTeam.create(user_id: users(:jane).id, team_id: teams(:Tools).id)
  end

  test "User must exist" do
    userteam = UserTeam.new(user_id: 999, team_id: teams(:DPL).id)
    assert_not userteam.save, "Saved a non-existent user"
  end

  test "Team must exist" do
    userteam = UserTeam.new(user_id: users(:john).id, team_id: 999)
    assert_not userteam.save, "Saved a non-existent team"
  end

  test "User/Team relationship must be unique" do
    userteam = UserTeam.new(user_id: users(:john).id, team_id: teams(:DPL).id)
    assert_not userteam.save, "Saved an existing user team relationship"
  end

  test "Users can be added to multiple teams" do
    userteam = UserTeam.new(user_id: users(:john).id, team_id: teams(:Tools).id)
    assert userteam.save, "User not able to be added to multiple teams"
  end
end
