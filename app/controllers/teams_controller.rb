class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end

  def show; end

  def new
    @team = Team.new
  end

  def create
    @team = Team.create(team_params)
    if @team.save
      redirect_to teams_path, notice: 'Team was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def confirm_delete
    @team = Team.find(params[:id])
  end

  def destroy
    @team = Team.find(params[:id])
    @team.destroy
    if @team.destroy
      redirect_to teams_path, notice: 'Team was successfully deleted.'
    else
      redirect_to teams_path, alert: 'Error deleting team.'
    end
  end

  def team_params
    params.require(:team).permit(:name)
  end
end
