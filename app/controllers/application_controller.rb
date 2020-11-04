class ApplicationController < ActionController::Base

    before_action :verified_user
    helper_method :current_user
    helper_method :logged_in?

    private

    def verified_user
        redirect_to '/home' unless logged_in?
    end

    def current_user
        User.find_by(id: session[:user_id])
    end
     
    def logged_in?
        !current_user.nil?
    end

end
