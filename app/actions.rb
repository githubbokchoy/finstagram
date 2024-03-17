#Controller code
# handles the HTTP requests using routes/actions
# sinatra uses get method
#when calling method , can remove parenthesis, i.e. get ('/')

=begin
def get (path)

end

=end

#handle the HTTP get request for the path '/', the default home path
#everytime there's an HTTP request, actions.rb gets triggered and sinatra goes through these requests and execute based on the actual requests
#no routing conditional needed

get '/' do

  # get all the finstagram posts from the DB (order by created at  field)
    @finstagram_posts = FinstagramPost.order(created_at: :desc)
    #created_at: :desc is a hash, where :desc is a symbol, note :: would be subclass, but note the space between the colons, so it's not a subclass
    erb(:index)  #last line is used for the bodyof response
    #"Hello"  # will literally print hello being the last line, will show up in response tab, 
  end


#include other pages
  get '/profile' do

    # get all the finstagram posts from the DB (order by created at  field)
    "profile page"
    end




    get '/signup' do     # if a user navigates to the path "/signup",
      @user = User.new   # setup empty @user object
      erb(:signup)       # render "app/views/signup.erb"
    end


    post '/signup' do

      #params.to_s  # prints to webpage
      #p params.to_s #debug prints to terminal
      #"Form submitted!"  #last line to print on webpage

# grab user input values from params
email      = params[:user_email]  #email not user_email in compass example
avatar_url = params[:avatar_url]
username   = params[:username]
password   = params[:password]

=begin
# if all user params are present, this validation uses actions.rb to validate, but inefficient
if email.present? && avatar_url.present? && username.present? && password.present?

  # instantiate and save a User
  user = User.new({ email: email, avatar_url: avatar_url, username: username, password: password })
  user.save

  # return readable representation of User object
  escape_html user.inspect

else

  # display simple error message
  "Validation failed."
end
=end

 # instantiate a User, notice in validation test above, instantiation is done after the test //this is the most succinct way vs. @email = , @avatar_url =
 @user = User.new({ email: email, avatar_url: avatar_url, username: username, password: password })
#@ ampersand instantiates a "global variable" "user" recognized by sinatra throughout the project, review concept of scope
#notice that in signup.erb, @user was called also

# if user validations pass and user is saved, this validation method uses activerecords instead of conditionals in actions.rb, refer to user.rb for validation rule
if @user.save

  # return readable representation of User object
  #escape_html user.inspect
  p @user.inspect
  "User #{username} saved!"

else

  # display error messages
  #escape_html user.errors.full_messages
  #p user.errors.full_messages #debug prints error message from active record validation
  #p user.inspect
  erb(:signup) #goes back to signup page
end

    end