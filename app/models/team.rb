class Team < ApplicationRecord
  has_many :user_teams
  has_many :users, through: :user_teams

  validates :name, uniqueness: true
  validates :name, presence: true
end
