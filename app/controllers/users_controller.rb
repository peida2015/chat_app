class UsersController < ApplicationController

  def new
    render 'static_pages/root' if current_user
  end

  def create
    @user = User.new(username: params[:username], password: params[:password])

    if @user.save
      login(@user)
      render @user
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to new_user_url
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end