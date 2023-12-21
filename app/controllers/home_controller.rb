class HomeController < ApplicationController
  def index
    @used_leave = current_user.used_leave
    @remaining_leave = current_user.annual_leave - @used_leave
  end
end
