# frozen_string_literal: true

source('https://rubygems.org')
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby('2.6.5')

gem('chartkick')
gem('dotenv-rails')
gem('pg')
gem('rails', '~> 6.0.2', '>= 6.0.2.2')

gem('activeadmin')
gem('puma', '~> 4.1')

gem('devise')
gem('groupdate')

gem('rswag-api')
gem('rswag-ui')
gem('rubocop-rails', require: false)
gem('sass-rails', '>= 6')

gem('webpacker', '~> 4.0')

gem('turbolinks', '~> 5')

gem('jbuilder', '~> 2.7')

gem('bootsnap', '>= 1.4.2', require: false)

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'rspec-rails', '~> 4.0.0'
  gem 'rswag-specs'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem('tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby])
