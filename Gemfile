source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '5.0.0'
# Use sqlite3 as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

#user management gem
gem "clearance"

#for security
gem "figaro"

#for facebook login
gem 'omniauth'
gem 'omniauth-facebook'

# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'jquery-ui-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'bootstrap-sass', '~> 3.3', '>= 3.3.6'
gem 'bootstrap-social-rails'
gem 'font-awesome-rails'
gem 'simple_form', '~> 3.2', '>= 3.2.1'
gem 'acts-as-taggable-on', '~> 4.0'
gem 'carrierwave', '>= 1.0.0.beta', '< 2.0', github: 'carrierwaveuploader/carrierwave'
gem "mini_magick"
gem 'rmagick', '~> 2.15', '>= 2.15.4'
gem 'cloudinary'
gem 'gon', '~> 6.1'
gem 'sidekiq', '~> 4.2', '>= 4.2.1'
gem 'braintree', '~> 2.66'
gem 'searchkick'
gem 'twitter-typeahead-rails', '~> 0.11.1'
gem 'bootstrap-typeahead-rails', '~> 0.10.5.1'
gem 'redis', '~> 3.3', '>= 3.3.1'



group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'guard'
  gem 'guard-rspec'
  gem 'guard-puma'
  gem 'rspec'
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'factory_girl_rails'
  gem 'shoulda-callback-matchers'
  gem 'capybara', '~> 2.7', '>= 2.7.1'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :production do
  gem 'rails_12factor'
  gem 'bonsai-elasticsearch-rails'
  gem 'puma'
end


