class LeavePeriodsController < ApplicationController
  before_action :set_leave_period, only: %i[ show edit update destroy ]

  # GET /leave_periods or /leave_periods.json
  def index
    @leave_periods = LeavePeriod.all
  end

  # GET /leave_periods/1 or /leave_periods/1.json
  def show
  end

  # GET /leave_periods/new
  def new
    @leave_period = LeavePeriod.new
  end

  # GET /leave_periods/1/edit
  def edit
  end

  # POST /leave_periods or /leave_periods.json
  def create
    @leave_period = LeavePeriod.new(leave_period_params)

    respond_to do |format|
      if @leave_period.save
        format.html { redirect_to leave_period_url(@leave_period), notice: "Leave period was successfully created." }
        format.json { render :show, status: :created, location: @leave_period }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @leave_period.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /leave_periods/1 or /leave_periods/1.json
  def update
    respond_to do |format|
      if @leave_period.update(leave_period_params)
        format.html { redirect_to leave_period_url(@leave_period), notice: "Leave period was successfully updated." }
        format.json { render :show, status: :ok, location: @leave_period }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @leave_period.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leave_periods/1 or /leave_periods/1.json
  def destroy
    @leave_period.destroy!

    respond_to do |format|
      format.html { redirect_to leave_periods_url, notice: "Leave period was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_leave_period
      @leave_period = LeavePeriod.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def leave_period_params
      params.require(:leave_period).permit(:user, :name, :start_time, :end_time)
    end
end
