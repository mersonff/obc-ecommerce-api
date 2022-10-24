source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.3'

gem 'bootsnap', '>= 1.4.4', require: false
gem 'devise_token_auth', '~> 1.2.0'
gem 'dotenv-rails', '~> 2.7.6'
gem 'inky-rb', require: 'inky'
gem 'jbuilder', '~> 2.11.5'
gem 'pg', '~> 1.4.1'
gem 'premailer-rails', '~> 1.11.1'
gem 'puma', '~> 5.6.4'
gem 'rack-cors', '~> 1.1.1'
gem 'rails', '~> 6.1.6'
gem 'redis', '~> 4.7.0'
gem 'sassc-rails', '~> 2.1.2'
gem 'sprockets', '~> 4.1.1'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'debase', '~> 0.2.5.beta2'
  gem 'factory_bot_rails', '~> 6.2.0'
  gem 'faker', '~> 2.21.0'
  gem 'rspec-rails', '~> 5.1.2'
  gem 'rubocop'
  gem 'ruby-debug-ide', '~> 0.7.3'
  gem 'shoulda-matchers', '~> 5.1.0'
end

group :development do
  gem 'listen', '~> 3.3'
  gem 'spring', '~> 4.0.0'
end

group :test do
  gem 'database_cleaner-active_record', '~> 2.0.1'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
