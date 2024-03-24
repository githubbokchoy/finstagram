require 'rubygems'
require 'bundler/setup'

require 'active_support/all'

# Load Sinatra Framework (with AR)
require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/contrib/all' # Requires cookies, among other things

require 'pry'

#require 'sinatra-rax' #to replace tux

APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__))
APP_NAME = APP_ROOT.basename.to_s

# Sinatra configuration
configure do
  set :root, APP_ROOT.to_path
  set :server, :puma

  enable :sessions
  set :session_secret, ENV['SESSION_KEY'] || 'f06bbeb1f88cce86fb7bf89b6c2d8aa88e2ebcd9c7a8bce0e27d3e6b4c8e6dc3'
# what does the above session key do?
  set :views, File.join(Sinatra::Application.root, "app", "views")
end

# Set up the database and models
require APP_ROOT.join('config', 'database')
#require './app/models/comment'  #added here to test rake db:datainput
# Load the routes / actions
require APP_ROOT.join('app', 'actions')
