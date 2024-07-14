require 'roda'

module SaneBudget
  class RodauthAuthentication < Roda
    include Deps[ DB: 'persistence.db' ]

    plugin :middleware
    # do sessions have to be managed by hanami ?
    plugin :sessions, secret: "Mylong secret string which has to be more than 64 char long and long and long"
    plugin :rodauth do
      enable :login, :logout, :create_account, :reset_password, :remember
      require_login_confirmation? false

      reset_password_autologin? true
      login_return_to_requested_location? true

      after_create_account do
        remember_login
      end

      login_redirect "/"
      logout_redirect "/login"
    end
    plugin :render, escape: true, views: 'lib/rodauth/'

    route do |r|
      rodauth.load_memory # auto-login if remembered account..
      r.rodauth

      #env['rodauth'] = rodauth # if rodauth needed through middleware stack..
      # below, redirect to login page unless authenticated...
      rodauth.require_account
    end
  end
end
