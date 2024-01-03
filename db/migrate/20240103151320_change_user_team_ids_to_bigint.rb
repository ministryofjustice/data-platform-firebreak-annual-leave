class ChangeUserTeamIdsToBigint < ActiveRecord::Migration[7.1]
  def change
    change_column :user_teams, :user_id, 'bigint USING CAST(user_id AS bigint)'
    change_column :user_teams, :team_id, 'bigint USING CAST(team_id AS bigint)'
  end
end
