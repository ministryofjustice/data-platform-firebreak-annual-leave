class HomeController < ApplicationController
  def index
    @used_leave = current_user.used_leave
    @remaining_leave = current_user.remaining_leave
  end
end
