# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'capybara/rspec'
require 'spork'


Spork.prefork do

 RSpec.configure do |config|
    config.mock_with :rspec
    config.use_transactional_fixtures = false
    config.treat_symbols_as_metadata_keys_with_true_values = true

    config.before(:suite) do
      DatabaseCleaner.strategy = :transaction
      DatabaseCleaner.clean_with(:truncation)
    end

    config.before(:each) do
      DatabaseCleaner.strategy = :truncation if example.metadata[:js]
      DatabaseCleaner.start
    end

    config.after(:each) do
      DatabaseCleaner.clean
      DatabaseCleaner.strategy = :transaction if example.metadata[:js]
    end

    config.include FactoryGirl::Syntax::Methods
    config.order = 'random'
  end

end

Spork.each_run do
  FactoryGirl.reload
end