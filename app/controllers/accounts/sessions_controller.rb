# frozen_string_literal: true

class Accounts::SessionsController < Devise::SessionsController
  # prepend_before_action :check_captcha, only: [:create] # Change this to be any actions you want to protect.

  # private

  # def check_captcha
  #   return if verify_recaptcha # verify_recaptcha(action: 'login') for v3

  #   self.resource = resource_class.new sign_in_params

  #   respond_with_navigational(resource) do
  #     flash.discard(:recaptcha_error) # We need to discard flash to avoid showing it on the next page reload
  #     render :new
  #   end
  # end 


  def after_sign_out_path_for(_resource_or_scope)
    new_account_session_path
  end

  def after_sign_in_path_for(resource_or_scope)
    stored_location_for(resource_or_scope) || root_path
  end
  
  
  
  
  
  
  
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
