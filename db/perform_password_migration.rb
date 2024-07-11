require 'sequel'

Sequel.extension :migration
Sequel.postgres( 'sane_budget', user: 'sane_budget_password' ) do |db|
  Sequel::Migrator.run(
    db,
    "#{File.dirname(__FILE__)}/rodauth_pw_migrate",
    table: 'schema_info_password'
  )
end
