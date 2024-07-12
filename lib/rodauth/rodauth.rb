require 'roda'

class RodauthAuthentication < Roda
  plugin :middleware
  # do sessions have to be managed by hanami ?
  plugin :sessions, secret: "Mylong secret string which has to be more than 64 char long and long and long"
  plugin :rodauth do
    enable :login, :logout, :create_account, :reset_password, :remember
    #password_minimum_length 10
    # role may be registered in a membership table together with foreign_keys 
    # user_id and company_id
    # It is better. Indeed, I can register a unique 'admin' for each company by 
    # checking the membership table... To do so, I can use after_create_account 
    # rodauth callback !
    login_redirect "/"
    login_return_to_requested_location? true
    reset_password_autologin? true
    logout_redirect "/login"

    after_create_account do
      remember_login
    end
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
