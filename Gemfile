source 'https://rubygems.org'
ruby '1.8.7'
gem 'rails', '3.2.11'
gem 'json'
gem 'jquery-rails'
# To use ActiveModel has_secure_password
gem "bcrypt-ruby", :require => "bcrypt"
#Paginations
gem 'will_paginate', '~> 3.0'


group :development, :test do
  gem 'mysql2'
end
group :production do
  gem 'pg'
  gem 'thin'
end
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'uglifier', '>= 1.0.3'
end