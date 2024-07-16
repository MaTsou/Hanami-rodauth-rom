require 'roda'

module SaneBudget
  class RodauthAuthentication < Roda

    registered_db = Hanami.app['persistence.db']
    secret = Hanami.app.settings['session_secret'] || "Mylong secret string which has to be more than 64 char long and long and long"

    plugin :middleware
    # do sessions have to be managed by hanami ?
    plugin :sessions, secret: secret, key: "sane_budget.session"
    plugin :route_csrf

    plugin :rodauth do
      db registered_db
      hmac_secret secret

      enable :login, :logout, :create_account, :reset_password, :remember,
        :active_sessions

      require_login_confirmation? false

      reset_password_autologin? true

      after_create_account do
        remember_login
      end

      login_return_to_requested_location? true
      login_redirect "/"
      logout_redirect "/login"
    end
    plugin :render, escape: true, views: 'lib/rodauth/'

    route do |r|
      check_csrf! { "Invalid token"; r.redirect "/" }

      rodauth.load_memory # auto-login if remembered account..
      rodauth.check_active_session

      r.rodauth

      env['rodauth'] = rodauth # if rodauth needed through middleware stack..
      rodauth.require_account
    end
  end
end
