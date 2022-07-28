class ApplicationController < ActionController::Base       
    helper_method :currentTimeAndDate, :accountAge
    def currentTimeAndDate
        @todaysDate = DateTime.now.strftime("%Y-%m-%d %H:%M:%S")
      end
    def accountAge
       TimeDifference.between(current_account.date_of_birth.strftime("%Y-%m-%d %H:%M:%S"), currentTimeAndDate).in_years
    end

    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception

    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :username, :date_of_birth, :is_female) }
        devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:password_confirmation, :current_password, :name, :email, :password, :username, :date_of_birth, :is_female) }
    end
end
