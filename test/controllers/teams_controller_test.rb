require 'test_helper'

class TeamsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @team = teams(:Tools)
    @user = users(:john)
    sign_in @user
  end

  test 'should get index' do
    get teams_url
    assert_response :success
  end

  test 'should get new' do
    get new_team_url
    assert_response :success
  end

  test 'should create team' do
    assert_difference('Team.count') do
      post teams_url, params: { team: { name: 'New Team' } }
    end
    assert_redirected_to teams_path
    follow_redirect!
    assert_not flash[:notice].empty?
  end

  test 'should fail to create team and render new' do
    assert_no_difference('Team.count') do
      post teams_url, params: { team: { name: '' } } # Assuming name can't be blank
    end
    assert_response :unprocessable_entity
  end

  test 'should show team' do
    get team_url(@team)
    assert_response :success
  end

  test 'should get confirm_delete' do
    get confirm_delete_team_url(@team)
    assert_response :success
  end

  test 'should destroy team' do
    assert_difference('Team.count', -1) do
      delete team_url(@team)
    end
    assert_redirected_to teams_path
    follow_redirect!
    assert_not flash[:notice].empty?
  end
end
