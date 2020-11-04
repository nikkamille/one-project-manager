class SessionsController < ApplicationController
    
    skip_before_action :verified_user, only: [:home, :new, :create]
    
    def home
    end

    def new
        @user = User.new
    end
 
    def create
        if request.env['omniauth.auth']	
            @user = User.from_omniauth(auth)
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else 
            @user = User.find_by(username: params[:username])
                if @user && @user.authenticate(params[:password])
                    session[:user_id] = @user.id
                    redirect_to user_path(@user)
                else
                    redirect_to "/login", alert: "Username and/or password is incorrect."
            end
        end
    end

    def destroy
        session.delete("user_id")
        redirect_to "/home"
    end

    private

    def auth
        request.env['omniauth.auth']
    end

end