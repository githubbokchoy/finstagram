#for deployment, for developement, use gemfile01 file; bundle install to recreate the gemfile.lock (remove gemlock file before bundle install)
#gem install bundler
#bundler update
#bundle install

source "https://rubygems.org"

gem 'puma'
gem 'rake'
gem 'activesupport'
gem 'activerecord', '< 6.1.0'
gem 'bcrypt'

gem 'sinatra', '~> 3.0.2'
gem 'sinatra-contrib'
gem 'sinatra-activerecord'

gem 'tux'
gem 'pry'

group :development, :test do
  gem 'shotgun'
  gem 'sqlite3', '~> 1.5.3'
end

group :production do
  gem 'pg'
end