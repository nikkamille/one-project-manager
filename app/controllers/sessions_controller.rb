class SessionsController < ApplicationController
    
    skip_before_action :require_login, only: [:home, :new, :create]
    
    def home
    end

    def new
        @user = User.new
    end
 
    def create
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            redirect_to "/login", alert: "Username and/or password is incorrect."
        end
    end

    def destroy
        session.delete("user_id")
        redirect_to "/home"
    end
end