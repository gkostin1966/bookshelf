# spec/support/database_cleaner.rb

require "database_cleaner-sequel"

Hanami.app.prepare(:persistence)
DatabaseCleaner[:sequel, db: Hanami.app["persistence.db"]]
DatabaseCleaner.allow_remote_database_url = true
DatabaseCleaner.url_allowlist = [%r{^postgres://postgres:postgres@db}] # match any db url with this prefix

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around(:each, type: :database) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end

