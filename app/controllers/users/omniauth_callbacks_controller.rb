class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # This needs to run even if user is not logged in, redirects after login
  skip_before_action :require_login, only: :google_oauth2

  # rubocop:disable Metrics/AbcSize, Metrics/LineLength
  def google_oauth2
    @user = User.from_omniauth(request.env['omniauth.auth'])

    if @user.persisted?
      flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Google'
      sign_in_and_redirect @user, event: :authentication
    else
      # Removes :extra as it can overflow some session stores
      session['devise.google_data'] = request.env['omniauth.auth'].except(:extra)
      redirect_to user_google_oauth2_omniauth_authorize_url, alert: @user.errors.full_messages.join("\n")
    end
  end
  # rubocop:enable Metrics/AbcSize, Metrics/LineLength
end
