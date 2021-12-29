source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.0'

gem 'rails', '~> 6.1.4.1'

# Basic
gem 'bootsnap', '>= 1.4.4', require: false
gem 'dotenv-rails'
gem 'inky-rb', require: 'inky'
gem 'pg', '~> 1.1'
gem 'premailer-rails'
gem 'puma', '~> 5.0'
gem 'rack-cors', '~> 1.1.1'
gem 'redis'
gem 'sassc-rails'
gem 'sinatra'
gem 'sidekiq'
gem 'sprockets'

# Auth
gem 'devise_token_auth', '~> 1.2.0'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'ruby-debug-ide', '~> 0.7.3'
  gem 'debase', '~> 0.2.4.1'
end

group :development do
  gem 'listen', '~> 3.3'
  gem 'spring'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
