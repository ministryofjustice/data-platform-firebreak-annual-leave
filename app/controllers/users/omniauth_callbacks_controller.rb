# This class handles OmniAuth callbacks for different providers
# for the User model. It extends from Devise's OmniAuthCallbacksController
# to integrate with Devise's authentication system.

module Users
  class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def azure_activedirectory_v2
      @user = find_or_create_user_from_omniauth
      handle_user_authentication
    end

    private

    def find_or_create_user_from_omniauth
      data = request.env['omniauth.auth']['info']
      user = User.find_by(email: data['email'])
      user ||= User.create(
        email: data['email'],
        password: Devise.friendly_token[0, 20],
        uid: request.env['omniauth.auth']['uid'],
        provider: request.env['omniauth.auth']['provider']
      )
      user
    end

    def handle_user_authentication
      if @user.persisted?
        set_flash_and_redirect('success', new_user_session_path)
      else
        set_flash_and_redirect('failure', new_user_registration_url)
      end
    end

    def set_flash_and_redirect(message, redirect_path)
      flash[:notice] = message
      sign_in_and_redirect @user, event: :authentication if message == 'success'
      redirect_to redirect_path if message == 'failure'
    end
  end
end
