class PagesController < ApplicationController
    before_action :authenticate_user! 


  def index
    if user_signed_in?
      @currentUser = current_user.name

      # redirect_to root_path
    else
      redirect_to new_user_session_path
    end

  end
  def errorPage

  end
end
