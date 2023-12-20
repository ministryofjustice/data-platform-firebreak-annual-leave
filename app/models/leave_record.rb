class LeaveRecord < ApplicationRecord
  belongs_to :user

  validate :no_duplicate_booking
  validate :end_date_after_start_date
  validate :no_overlap, if: -> { start_date && end_date }

  private

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?
    errors.add(:end_date, "must be after the start date") if end_date < start_date
  end

  def no_overlap
    overlapping_leaves = LeaveRecord.where(user_id: user_id)
                                    .where.not(id: id) # Exclude the current record if it's already saved
                                    .where("(start_date <= ? AND end_date >= ?) OR (start_date >= ? AND start_date <= ?) OR (end_date >= ? AND end_date <= ?)", start_date, start_date, start_date, end_date, start_date, end_date)
    
    errors.add(:base, "overlaps with existing leave") if overlapping_leaves.exists?
  end

  def no_duplicate_booking
    existing_record = LeaveRecord.where(user_id: user_id, start_date: start_date, end_date: end_date).exists?
    errors.add(:base, "Leave for these dates already booked") if existing_record
  end
end