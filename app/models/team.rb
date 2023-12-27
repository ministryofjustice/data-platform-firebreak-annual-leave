class Team < ApplicationRecord
  has_many :team_memberships
  validates :name, uniqueness: true
  validates :name, presence: true
end
