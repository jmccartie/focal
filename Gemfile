source 'https://rubygems.org'

gem 'rails', '3.2.9'
gem 'pg'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
  gem "compass-rails", "~> 1.0.3"
  gem "twitter-bootstrap-rails"
end

gem 'jquery-rails'
gem 'jbuilder'
gem 'haml-rails'
gem 'sorcery'

group :production do
  gem 'unicorn'
end

group :development do
  gem 'letter_opener'
  gem 'sextant'
  gem 'thin'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem "quiet_assets", "~> 1.0.1"
  gem 'guard'
  gem "guard-spork"
  gem 'guard-rails'
  gem 'guard-rspec'
  gem 'rb-fsevent', '~> 0.9.1'
end

group :development, :test do
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'capybara', '~> 1.1.3'
  gem 'capybara-webkit', '~> 0.12.1'
end

group :test do
  gem 'database_cleaner'
  gem 'guard'
  gem 'guard-spork'
  gem 'guard-rails'
  gem 'guard-rspec'
  gem 'growl'
  gem 'spork-rails'
  gem 'rspec-rails'
end

group :test, :development do
  gem 'pry-rails'
end
