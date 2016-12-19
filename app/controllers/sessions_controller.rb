class SessionsController < ApplicationController
  def new
  end

  def create
    @session = Session.new(
      email: params[:session][:email],
      password: params[:session][:password]
    )

    if @session.valid?
      session[:logged_in] = true
      redirect_to root_path
    else
      render :new, status: :bad_request
    end
  end
end

