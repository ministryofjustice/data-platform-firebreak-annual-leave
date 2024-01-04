class CreateUserTeams < ActiveRecord::Migration[7.1]
  def change
    create_table :user_teams do |t|
      t.string :user_id
      t.string :team_id

      t.timestamps
    end
  end
end
