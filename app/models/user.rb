class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[azure_activedirectory_v2]

  has_many :leave_records

  def used_leave
    @leave_records = leave_records
    used_leave = 0

    # Count weekdays between
    @leave_records.each do |leave_record|
      (leave_record.start_date...leave_record.end_date).each { |d| used_leave += 1 if (1..5).include?(d.wday) }
    end

    used_leave
  end

  def remaining_leave
    annual_leave - used_leave
  end
end
