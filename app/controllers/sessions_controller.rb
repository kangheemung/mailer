class SessionsController < ApplicationController
    def new
        
    end
    def create
        @user = User.find_by(email: params[:session][:email].downcase)
        if @user && @user.authenticate(params[:session][:password])
            session[:user_id]=@user.id
             redirect_to users_show_path(@user.id)
        else
            redirect_to root_url
        end
    end
end
