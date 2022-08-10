class ApplicationController < ActionController::Base
    #     def update_profile
    #     if account_signed_in? && current_account.date_of_birth.nil?
    #     redirect_to '/accounts/edit'
    #   end
    # end
    # def after_sign_in_path_for(resource)
    #     account_path(current_account) # your path
    #   end


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
        devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :username, :date_of_birth, :is_female, :account_id, :password_confirmation) }
        devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:password_confirmation, :current_password, :name, :email, :password, :username, :date_of_birth, :is_female) }
    end

 
        private
    def add_date_of_birth
        if account_signed_in? 
        if current_account.date_of_birth.nil?
            redirect_to '/accounts/edit', notice: "Please update your age, and password to use this website"
            end
          
          end
        end
    before_action :add_date_of_birth, except: [:edit, :update, :destroy]
    
end
