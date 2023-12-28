class CreateUserTeams < ActiveRecord::Migration[7.1]
  def change
    create_table :user_teams do |t|
      t.string :user_email
      t.string :team_name

      t.timestamps
    end
  end
end
