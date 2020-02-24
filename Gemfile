source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.3'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

# Static code analysis
gem 'rubocop-rails'
gem 'rubocop-rspec'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# For managing user authentication and authorization
gem 'cancancan'
gem 'devise'
# OmniAuth Google OAuth2 Strategy
gem 'omniauth-google-oauth2', '~> 0.6.0'

# https://github.com/twbs/bootstrap-rubygem
gem 'bootstrap', '~> 4.3.1'
gem 'jquery-rails'

# Convenient way to add a stylesheet to an HTML email rather than inline css
gem 'premailer-rails'

group :development, :test do
  gem 'rspec-rails', '~> 3.8'

  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Easier debugging
  gem 'better_errors'
  gem 'binding_of_caller'

  # Prettier console & debugging
  gem 'pry-rails'

  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  # Alternate user roles easily in development
  gem 'switch_user'

  # Preview emails in browser rather than delivering them: https://github.com/ryanb/letter_opener
  gem 'letter_opener_web'
end

group :test do
  gem 'shoulda', '~> 3.5'
  # Use Factory Bot instead of fixtures
  gem 'factory_bot_rails'

  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'

  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'webdrivers'

  # Mock live http requests
  gem 'webmock'

  # Adds more assertions for request (controller) specs
  gem 'rails-controller-testing'
end
