require 'test_helper'

class TeamTest < ActiveSupport::TestCase
  test "Team names must not be blank" do
    team = Team.new
    assert_not team.valid?, "Team is valid without a name"
    assert_not_empty team.errors[:name], "No validation error for name being blank"
  end

  test "Team names must not be duplicated" do
    existing_team = teams(:DPL)
    duplicate_team = Team.new(name: existing_team.name)
    assert_not duplicate_team.valid?, "Team is valid with a duplicate name"
    assert_not_empty duplicate_team.errors[:name], "No validation error for name being duplicate"
  end
end
