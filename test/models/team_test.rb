require 'test_helper'

class TeamTest < ActiveSupport::TestCase
  setup do
    Team.create(name: "HR")
  end

  test "Team names must not be blank." do
    team = Team.new
    assert_not team.save, "Saved a team with no name"
  end

  test "Team names must not be duplicated." do
    team = Team.create(name: "HR")
    assert_not team.save, "Saved a team with a duplicate name"
  end
end
