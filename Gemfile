source 'https://rubygems.org'

# heroku things
ruby '2.2.4'
gem 'figaro'
gem 'mailgun_rails'
gem 'rqrcode'

gem 'rails', '4.2.6'
gem 'sqlite3', group: :development
gem 'rails_12factor', group: :production

gem 'pg', group: :production


# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# REST-client for using URI
gem 'rest-client'
gem 'stripe'

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# ui related
gem 'foundation-rails'

# User authetication gem
# Use ActiveModel has_secure_password
gem 'devise'
gem 'omniauth'
gem 'bcrypt', '~> 3.1.7'

# Use Puma as the app server
#gem 'puma'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'rspec-rails', '~> 3.0'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console> in views
  gem 'web-console', '~> 2.0'
  gem 'pry'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end


## datetimepicker
source 'https://rails-assets.org' do
  gem 'rails-assets-datetimepicker'
end
