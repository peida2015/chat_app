class StaticPagesController < ApplicationController
  def root
    if current_user
      debugger
      redirect_to chats_url
    else
      render :root
    end
  end
end
