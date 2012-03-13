source 'https://rubygems.org'

gem 'rails', '3.2.2'

gem 'mysql2', "0.3.11"
gem 'cancan', '1.6.7'
#gem 'devise', '1.4.9'
gem 'devise', '2.0.4'

gem 'fastercsv' # Only required on Ruby 1.8 and below

#gem 'rails_admin', :git => 'git://github.com/sferik/rails_admin.git'
gem 'rails_admin', :path => "vendor/gems/rails_admin"
gem 'log4r', '1.1.9'

gem 'json'
gem "paperclip", "~> 2.7"

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # TODO don't use this in production, install node.js
  gem "execjs", "1.3.0"
  gem 'therubyracer', "0.9.9"

  gem 'uglifier', '>= 1.0.3'
end
group :development, :test do
  gem 'factory_girl_rails', '1.3.0'
  #gem 'rspec', '2.8.0'
  gem 'rspec-rails', '2.8.1'
end

gem 'jquery-rails'

# Deploy with Capistrano
gem 'capistrano', "2.11.2"

