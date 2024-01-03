require 'test_helper'

class TeamTest < ActiveSupport::TestCase
  test "Team names must not be blank." do
    team = Team.new
    assert_not team.save, "Saved a team with no name"
  end

  test "Team names must not be duplicated." do
    team = Team.create(name: "DPL")
    assert_not team.save, "Saved a team with a duplicate name"
  end
end
