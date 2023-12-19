class AddAnnualLeaveToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :annual_leave, :integer, default: 25
  end
end