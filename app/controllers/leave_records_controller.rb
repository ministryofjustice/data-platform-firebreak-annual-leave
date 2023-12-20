class LeaveRecordsController < ApplicationController
  before_action :authenticate_user!

  def index
    @leave_records = current_user.leave_records
  end

  def new
    @leave_record = LeaveRecord.new
  end

  def create
    @leave_record = LeaveRecord.new(leave_record_params)
    @leave_record.user = current_user

    if @leave_record.save
      redirect_to @leave_record, notice: 'Leave was successfully booked.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @leave_record = current_user.leave_records.find_by(id: params[:id])
    return unless @leave_record.nil?

    redirect_to root_path, alert: 'Leave record not found or not accessible'
  end

  def confirm_delete
    @leave_record = current_user.leave_records.find(params[:id])
  end

  def destroy
    @leave_record = current_user.leave_records.find(params[:id])
    if @leave_record.destroy
      redirect_to leave_records_path, notice: 'Leave record was successfully deleted.'
    else
      redirect_to leave_records_path, alert: 'Error deleting leave record.'
    end
  end

  private

  def leave_record_params
    params.require(:leave_record).permit(:start_date, :end_date, :user_id)
  end
end
