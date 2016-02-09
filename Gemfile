if RUBY_VERSION =~ /1.9/
Encoding.default_external = Encoding::UTF_8
Encoding.default_internal = Encoding::UTF_8
end

source 'http://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 4.2', '>= 4.2.5'

# Use sqlite3 as the database for Active Record
gem 'mysql2', '~> 0.3.18'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

gem 'friendly_id', '~> 5.0.1'

gem 'nokogiri'

gem 'whenever', :require => false

gem 'activeadmin', github: 'gregbell/active_admin'

gem 'will_paginate', '~> 3.0'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :production do
  gem 'pg'
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
gem 'unicorn'

# Use Capistrano for deployment
gem "capistrano", "~> 2.9.0"

# Use debugger
# gem 'debugger', group: [:development, :test]

gem 'puma'
gem 'devise'
gem "cancan"
gem 'mailboxer'
gem 'chosen-rails'
gem 'best_in_place'
gem 'remotipart'
gem 'carrierwave', :github => 'satoruk/carrierwave' , :ref => '43179f94d6a4e62f69e812f5082d6447c9138480'
gem 'rmagick', require: false
gem 'net-ssh', '~> 2.6.5'

gem "font-awesome-rails"

group :development do
  gem 'rspec-rails', '~> 3.0'
  gem 'factory_girl_rails'
  gem 'guard-rspec'
end