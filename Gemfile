source 'https://rubygems.org'

gem 'rails', '3.2.17'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'
group :development do
  # gem 'sqlite3'
end

group :production, :staging do
  gem 'unicorn'
  gem 'rack-google_analytics', :require => "rack/google_analytics"
end


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
  gem 'bootstrap-sass', '~> 3.1.1'
end

#gem 'sqlite3'

gem 'pg'
gem 'jquery-rails'
gem 'devise'
gem 'devise_invitable'
gem 'json'
gem 'colored'
gem 'stripe', :git => 'https://github.com/stripe/stripe-ruby'
gem 'browser'
gem 'formtastic'
gem 'formtastic-bootstrap'
gem 'chartkick'
gem 'minitest'
gem 'test-unit'
gem 'thin'


gem 'rails_12factor', group: :production
