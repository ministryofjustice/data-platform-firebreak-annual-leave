class CalendarController < ApplicationController
  before_action :authenticate_user!

  def index
    # Scope your query to the dates being shown:
    start_date = params.fetch(:start_date, Date.today).to_date
    @leave_periods = LeaveRecord.where(
      start_date: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week,
      user_id: current_user
    ).select('start_date as start_time', 'end_date as end_time', :user_id)
  end

  def team
    # Scope your query to the dates being shown:
    start_date = params.fetch(:start_date, Date.today).to_date
    current_users_teams = UserTeam.where(user_id: current_user.id).pluck(:team_id)
    all_users_in_the_current_users_teams = UserTeam.where(team_id: current_users_teams).pluck(:user_id)
    @leave_periods = LeaveRecord.where(
      start_date: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week,
      user_id: all_users_in_the_current_users_teams
    ).select('start_date as start_time', 'end_date as end_time', :user_id)
  end
end
