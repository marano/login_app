class HomeController < ApplicationController
  before_action :require_session

  def index
  end

  private

  def require_session
    redirect_to new_session_path unless session[:logged_in]
  end
end
