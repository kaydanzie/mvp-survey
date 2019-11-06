class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # This needs to run even if user is not logged in, redirects after login
  skip_before_action :require_login, only: :google_oauth2

  # rubocop:disable Metrics/AbcSize
  def google_oauth2
    @user = User.from_omniauth(request.env['omniauth.auth'])

    if @user.persisted?
      flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Google'

      # keeps bugging the user every time they login until they set their office location
      unless @user.office
        sign_in @user
        return redirect_to office_user_url(@user)
      end

      sign_in_and_redirect @user, event: :authentication
    else
      # Removes :extra as it can overflow some session stores
      session['devise.google_data'] = request.env['omniauth.auth'].except(:extra)
      redirect_to root_url, flash: { error: @user.errors[:email].first }
    end
  end
  # rubocop:enable Metrics/AbcSize
end
