class UserTeam < ApplicationRecord
  validates_uniqueness_of :team_id, scope: :user_id, message: "/ User relationship already exists."
  validates :team_id, :user_id, presence: true
  belongs_to :user
  belongs_to :team
end
