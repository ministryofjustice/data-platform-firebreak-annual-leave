class AddAnnualLeaveToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :annual_leave, :integer
  end
end
