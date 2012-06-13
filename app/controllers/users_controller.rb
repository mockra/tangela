class UsersController < ApplicationController

  before_filter :authenticate, except: [ :new, :create ]

  def new
    @user = User.new
  end

  def create
    @user = User.new params[:user]
    if @user.save
      cookies.permanent[:auth_token] = @user.auth_token
      redirect_to root_url, notice:
        'Account created.'
    else
      render :new
    end
  end

  def edit
    @user = current_user
  end

  def update
    if current_user.update_attributes params[:user]
      redirect_to root_url
    else
      render :edit
    end
  end

end
