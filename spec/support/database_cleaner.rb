require "database_cleaner-sequel"

Hanami.app.prepare :persistence
DatabaseCleaner[ :sequel, db: Hanami.app[ 'persistence.db' ] ]

Rspec.configure do |config|
  config.before :suite do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with :truncation
  end

  config.around :each, type: :database do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end
