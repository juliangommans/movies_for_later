class SessionsController < Devise::SessionsController
  respond_to :html, :json
  include Devise::Controllers::Rememberable

  def create
    if current_user
      remember_me(current_user) if params[:remember_me].present?
    end
    super
  end

end
