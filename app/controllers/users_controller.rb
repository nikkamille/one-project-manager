class UsersController < ApplicationController

    skip_before_action :verified_user, only: [:new, :create]

    def index
        @users = User.all
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)

        if @user.save
            session[:user_id] = @user.id
            redirect_to '/home'
        else
            render :new
        end
    end

    def show
        @user = User.find_by(id: params[:id])
    end

    def destroy
        @user = User.find(params[:id]).destroy
        redirect_to users_path
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password, :password_confirmation, :admin)
    end

end
