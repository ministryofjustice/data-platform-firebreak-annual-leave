class UserTeamsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user_teams = UserTeam.all
  end

  def show; end

  def new
    @user_team = UserTeam.new
  end

  def create
    # Team name and user email should be unique, so they should map to an id
    if (team_record = Team.where(name: params[:user_team][:team_name]).first)
      team_id = team_record.id; end
    if (user_record = User.where(email: params[:user_team][:user_email]).first)
      user_id = user_record.id; end
    @user_team = UserTeam.create(team_id:, user_id:)
    if @user_team.save
      redirect_to user_teams_path, notice: 'Team membership was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def confirm_delete
    @user_team = UserTeam.find(params[:id])
  end

  def destroy
    @user_team = UserTeam.find(params[:id])
    @user_team.destroy
    if @user_team.destroy
      redirect_to user_teams_path, notice: 'Team was successfully deleted.'
    else
      redirect_to user_teams_path, alert: 'Error deleting team.'
    end
  end

  def user_team_params
    params.require(:user_team).permit(:team_name, :user_email)
  end
end
