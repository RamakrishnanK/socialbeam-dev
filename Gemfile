#Before bundle install
#jRuby 1.7 RC1 : rvm install jruby-1.7.0.RC1
#rvm use jruby-1.7.0.RC1
#Neo4J Graph DB Core: jruby -S gem install 'neo4j-core' 'neo4j' 'neo4j-wrapper'
#JDBC-MySQL : jruby -S gem install jdbc-mysql activerecord-jdbcmysql-adapter
#Rails 3.1.10 : jruby -S gem install rails -v='3.1.10'
source 'https://rubygems.org'

gem 'rails', '3.1.10'
gem 'neo4j'
gem 'neo4j-core'
gem 'neo4j-wrapper'
gem 'json','~>1.7.6'
gem 'jquery-rails','~>2.1.4'
gem 'execjs','~>1.4.0'
gem 'therubyrhino'

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
  gem 'sass-rails',   "~> 3.1.5"
  gem 'uglifier', '>= 1.0.3'
end
