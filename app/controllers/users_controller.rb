class UsersController < ApplicationController
  def show
    @nickname = current_user.nickname
    @tastes = current_user.tastes
  end
end
