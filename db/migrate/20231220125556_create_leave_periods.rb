class CreateLeavePeriods < ActiveRecord::Migration[7.1]
  def change
    create_table :leave_periods do |t|
      t.string :user
      t.string :name
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
