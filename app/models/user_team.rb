class UserTeam < ApplicationRecord
  validates :team_name, :user_email, uniqueness: true
  validates :team_name, :user_email, presence: true
  validate :team_exists
  validate :user_exists

  def team_exists
    errors.add(self.team_name, 'has not been registered.') if Team.where(name: self.team_name).exists? == false
  end

  def user_exists
    errors.add(self.user_email, 'has not been registered.') if User.where(email: self.user_email).exists? == false
  end
end
