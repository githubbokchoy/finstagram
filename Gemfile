# A sample Gemfile for developer windows version
source "https://rubygems.org"

gem 'rake'
gem 'activesupport'
gem 'activerecord', '< 6.1.0'
gem 'sinatra', '~> 3.0.2'
gem 'sinatra-contrib'
gem 'sinatra-activerecord'

gem 'puma'

#gem 'rails', '>= 5.2.2.1'
#gem 'psych', "~> 4"  #cannot be a newer version, since Psych 5 is not compatible with activerecords

gem 'pry'

group :development, :test do
  #gem 'activerecord', '>= 4.2.0'
  #gem 'sinatra'
  gem 'tux'
  gem "bigdecimal", '>= 1.3.0'
  gem "rack", '>= 1.0'
  gem "rackup"
  gem 'reek'  #relaxes dependency on psych versions
  #gem 'pry'
  #gem 'shotgun', git: 'https://github.com/delonnewman/shotgun.git'
  #gem 'shotgun'
  gem 'sqlite3', '>= 1.3.6', platforms: [:mingw, :mswin, :x64_mingw, :ruby] #1.5.3 for render
  #gem 'sqlite3', '>= 1.5.3'
 
end
#gem "sinatra-rax", "~> 1.0"  #execute by typing rax (not bundle exec rax), https://github.com/shreeve/sinatra-rax


group :production do
  

  gem 'pg'

end

