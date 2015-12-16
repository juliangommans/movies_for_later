class UserController < ApplicationController
  # before_filter :authenticate_user!

  def show
    if current_user.present?
      @user = current_user
      render "show"
    else
      render "guest"
    end
  end
end
