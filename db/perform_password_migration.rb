require 'sequel'
if ENV['DATABASE_URL']
  # DATABASE_URL env var format is
  # protocole://user_name:pwd@host
  #
  # providing a dedicated regex, one can get each required parts of it :
  # user_name, pwd and host as first part, second part and third part.
  parts = ENV['DATABASE_URL'].match /[^\/]*\/\/([^:]*):([^@]*)@(.*)/

  Sequel.extension :migration
  Sequel.postgres(
    parts[1],
    user: "#{parts[1]}_password", # here the pwd specific user
    password: parts[2],
    host: parts[3]
  ) do |db|
    Sequel::Migrator.run(
      db,
      "#{File.dirname(__FILE__)}/rodauth_pw_migrate",
      table: 'schema_info_password'
    )
  end

else
  p "please provide a DATABASE_URL env var.."
end
