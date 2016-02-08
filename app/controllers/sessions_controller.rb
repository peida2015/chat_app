class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    user = User.find_by_credentials(params[:username], params[:password])

    if user
      login(user)
      redirect_to chats_url
    else
      flash[:errors] = ['Username/Password is not correct']
      redirect_to new_session_url
    end
  end

  def destroy
    logout
    redirect_to new_session_url
  end

end
