class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.where(
      login: params[:session][:login], password: params[:session][:password]
    ).first
    if @user
      sign_in
      redirect_to '/comics'
    else
      render 'new'
    end
  end
end
