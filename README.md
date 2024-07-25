# Hanami-rodauth-rom
Hanami 2.1 web app with ROM db managment and Rodauth middleware authentication
-------------
A try to get a basic hanami 2.1 app provided standard CRUD operations and 
topped with a Rodauth authentication.

Now Hanami 2.2 is released, all the ROM configuration stuff is provided out of the box.

## Design choices
+ Rodauth manage authentication and only authentication. Hence, Hanami has to 
  execute all other security features (csrf, sql-injection, parameter coercions 
  or sanitization)
+ Use custom view-component objects; hanami-view do not provide components : 
  user may use helpers and partials only.
  I will test and choose the better way for me.
  + component way, using app container :

  ```
  # inside the view (dedicated view or view.rb)
  include Deps['components.icon']

  # inside a template
  <%= icon.render(:home, style: 'font-size: 1.2em;', class: 'whatever' ) %>
  ```
  pros : possibility to use view exposures to create icons html code. So 
  template stay clean. See current code..

  + partial way :

  ```
  <%= render "icon", name: :home, style: 'font-size: 1.2em;', class: '' %>
  # _icon.html.erb template
  <iconify-icon ...>
  ```
  This is subject to evolution. Not completely satisfying. Indeed, my code is 
  not totally dry..

+ Haml templating style usage. I did not want but I met issues using erb with 
  block capture..

## post deployment actions (jelastic)
My current Jelastic configuration uses 2 containers. One for database and one 
for the app.
1.  Install all needed gems
  ```
  # app container
  bundle install
  ```
1. set all ENV variables : (read `key_gen` : easy key generation)
  + DATABASE_URL
  + HANAMI_ENV
  + SESSION_SECRET
1. prepare database for Rodauth migration (following Rodauth github page).
  `app_name` and `app_name_password` users need a password. It can be supplied 
  at creation time (an option to `createuser`) or using SLB access.
  ```
  # database container
  createuser -U postgres app_name
  createuser -U postgres app_name_password
  # set users pwd if not already done
  createdb -U postgres -O app_name app_name
  psql -U postgres -c "CREATE ENTENSION citext" app_name
  psql -U postgres -c "GRANT CREATE ON SCHEMA public TO app_name_password" app_name
  ```
1. Perform migrations
  ```
  # app container
  rake db:migrate
  ruby db/perform_rodauth_migration.rb
  ```
1. Revoke temp permission:
  ```
  # database container
  psql -U postgres -c "REVOKE CREATE ON SCHEMA public FROM app_name_password" app_name
  ```
1. Prepare assets for production
  ```
  # app container
  npm install
  hanami assets compile
  ```
1. Run the server and enjoy..

## TODOs
Things I want to include in this example.
1. I18.n localization.
1. Make tests work ! I am a bit disappointed here (and then I do not push my 
   work on it).
  + I thought with a dry architecture, unit test would be easy; I could test my 
    views in isolation. But, running tests on views raise 'missing request 
    error'/'View should be called by action'. This is not isolation !
  + Another problem : `database_cleaner` claims it does not have enough 
    permission (maybe related to the specific Rodauth password management..)
