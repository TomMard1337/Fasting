class Accounts::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  
  
  def google_oauth2
    handle_auth "Google"
  end

  # def github
  #   handle_auth "Github"
  # end
  
  
  
  def google_oauth2
    account = Account.from_omniauth(auth)

    if account.present?
      sign_out_all_scopes
      flash[:success] = t 'devise.omniauth_callbacks.success', kind: 'Google'
      sign_in_and_redirect account, event: :authentication
      Account.find_by_email(params[:email]).try(:valid_password?, params[:password])
    else
      flash[:alert] =
        t 'devise.omniauth_callbacks.failure', kind: 'Google', reason: "#{auth.info.email} is not authorized."
      redirect_to new_account_session_path
    end
  end

  protected

  def after_omniauth_failure_path_for(_scope)
    new_account_session_path
  end

  def after_sign_in_path_for(resource_or_scope)
    stored_location_for(resource_or_scope) || root_path
  end

  private

  def auth
    @auth ||= request.env['omniauth.auth']
  end
end