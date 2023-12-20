class CreateLeaveRecords < ActiveRecord::Migration[7.1]
  def change
    create_table :leave_records do |t|
      t.references :user, null: false, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.string :leave_type, default: 'annual'
      t.string :status, default: 'pending'
      t.text :comments

      t.timestamps
    end
  end
end
