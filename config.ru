# Require config/environment.rb
require ::File.expand_path('../config/environment',  __FILE__)

set :app_file, __FILE__
run Sinatra::Application


#use Rack::MethodOverride
#run ApplicationController  # error when running rackup 


#following comes from an online tutorial
# $: << File.dirname(__FILE__) 
# require 'address-book'
# run AddressBook.new