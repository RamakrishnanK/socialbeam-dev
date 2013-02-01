source 'https://rubygems.org'

#Rails 3.2.11 Gem
gem 'rails', '3.2.11'

#Neo4J Graoh DB
gem 'neo4j','~>2.2.3'
gem 'neo4j-core','~>2.2.3'
gem 'neo4j-wrapper','~>2.2.3'
gem 'neography','~>1.0.6'

gem 'json','~>1.7.6'
gem 'jquery-rails','~>2.1.4'
gem 'execjs','~>1.4.0'
gem 'therubyrhino','~>2.0.2'
gem 'jruby-openssl','~>0.8.2',:require => false

#Easy deployment in Amazon EC2
gem 'capistrano','~>2.14.1'
gem 'rvm-capistrano','~>1.2.7'

#ActiveModels has_secure_password
gem "bcrypt-ruby", '~>3.0.1',:require => "bcrypt"

#Paginations
gem 'will_paginate', '~> 3.0'

group :development, :test , :production do
  gem 'activerecord-jdbcmysql-adapter'
end

group :assets do
  gem 'sass-rails'
  gem 'uglifier'
end

group :development,:test do
  gem 'hirb'
  gem 'interactive_editor'
end
