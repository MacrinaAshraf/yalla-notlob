class PaswordsController < ApplicationController

    def new
    end
    
    def create

        @user =  User.find_by_email(params[:user][:email])
        if @user 
            if  @user.update_attribute('password',params[:user][:new_password])
                redirect_to root_path 
            else
                @message = "invalid  process "
                flash[:alert] = 'invalid process'
                redirect_to :action => 'new' , flash: {alert: "invalid process"}
            end
        else
            @message = "invalid mail "
            flash[:alert] = 'invalid mail'
            redirect_to :action => 'new', flash: {alert: "invalid mail"}
        end



        # @email=params[:user][:email]
        # @password=params[:user][:new_password]


    
    
    end
end
