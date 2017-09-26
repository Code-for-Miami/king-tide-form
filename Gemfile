source 'https://rubygems.org'
ruby '2.2.4'

## Required
gem 'rails', '>= 4.2.5'
gem 'pg'                              # An Elephant never forgets
gem 'therubyracer',  platforms: :ruby
gem 'bundler'
gem 'puma'                            # That's one fast cat
gem 'tzinfo-data'                     # Timey Wimey stuff

## Asset Handlers Stuff
gem 'sass-rails'                      # Use SCSS for stylesheets
gem 'uglifier', '>= 1.3.0'            # Use Uglifier as compressor for JavaScript assets
gem 'coffee-rails', '~> 4.0.0'        # Use CoffeeScript for .js.coffee assets and views
gem 'jquery-rails'                    # Use jquery as the JavaScript library

## View
gem 'turbolinks'                      # AJAX page requests
gem 'jbuilder', '~> 2.0'              # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'sdoc', '~> 0.4.0', group: :doc   # bundle exec rake doc:rails generates the API under doc/api.

## Libraries

# gem 'bootstrap', '~> 4.0.0.beta'

gem 'bootstrap-sass', '3.3.5'
gem 'bootstrap-sass-extras'
gem 'bootstrap-popover-rails'

gem 'google-analytics-rails'
gem 'activeadmin', '~> 1.1.0'
gem 'devise'
gem 'validates_formatting_of'
gem "paperclip", "~> 5.0.0"
gem 'aws-sdk', '~> 2.3'
gem 'high_voltage', '~> 3.0.0'
gem 'figaro'

## Environment Specific

group :production do
  gem 'rails_12factor'
end

group :development do
  gem 'spring'            # Makes the dev server bouncy
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'debug-extras' # Is a temporary fix for slow REPL see https://github.com/charliesome/better_errors/issues/341
end