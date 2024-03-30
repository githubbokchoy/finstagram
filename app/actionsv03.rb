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


helpers do  #why helpers rather than a bunch of standalone methods? can helpers accept inputs?
    def current_user
      User.find_by(id: session[:user_id])
    end
  
    def is_prior_logout
      params[:logout]
      #p self  #this prints the entire login.erb file in terminal
    end
  
    def view_before_signin
      params[:signinfirst]
    end 
  
    def no_session_logout
      params[:nosessionlogout]
      
    end
  
  #case to get input into 
  end
  
  get '/' do
  
    # get all the finstagram posts from the DB (order by created at  field)
    #issue, what if DB isn't available, can we build a new one??? Try deleting all records, and see if it works, if not, delete whole table, then use signup to recreate everything
    #conditional to check if finstagram table exist or use validate function? active record
  #   check warning messages SIGUSR2 not implemented, signal based restart unavailable!
  # *** SIGUSR1 not implemented, signal based restart unavailable!
  # *** SIGHUP not implemented, signal based logs reopening unavailable!
  
  
      pp session
      session["brand_new key"] = "hey JJ kid"  #refer to environment.rb for sessino creation, cookies
  @current_user
  
      @finstagram_posts = FinstagramPost.order(created_at: :desc)
      #created_at: :desc is a hash, where :desc is a symbol, note :: would be subclass, but note the space between the colons, so it's not a subclass
      #@current_user = User.find_by(id: session[:user_id])  #this line is superseded by the helper method for current user at the top
  
  
      if !current_user
      p "if not signd in, redirecting from homepage to login page"
      p session #notice that session does not have user_id field even showing
      redirect to('/login?signinfirst=true')
      else
       p "signed in, display home page " #if user already signed in, session in place
       p session #if user already signed in, session in place-->
      
  
      erb(:index)  #last line is used for the bodyof response
      #"Hello"  # will literally print hello being the last line, will show up in response tab, 
      end
    end
  
  
  #include other pages
    get '/profile' do
  
      # get all the finstagram posts from the DB (order by created at  field)
      "profile page"
      end
  
  
      get '/login' do  #go to login page
  
        # login page
  
        if current_user #if user already logged in, redirect to homepage
  
          redirect to('/')
  
        else # if user is not logged in
  
        #is_prior_logout = params["logout"]
        is_prior_logout = params[:logout]
        view_before_signin = params[:signinfirst]
        #params.to_s
        p "you're at the login page"
        p is_prior_logout  #should print true if just logged out
        #p @is_prior_logout
        erb(:login) 
        end
  
      end
  
        
      post '/login' do # when we submit a form with an action of /login
        #params.to_s   # just display the params for now to make sure it's working, displays hash from sinatra
        # login page
        username   = params[:username]
        password   = params[:password]
        @user = User.find_by(username: username)  ## 1. find user by username, 
        # pp user #debug to see if user exists (nil means user doesn't exist)
        if @user && @user.password == password #check if user exists and that user's password matches the password input
          session[:user_id]=@user.id
          #"success, #{@user.username} logged in!"
          p "Success! User with id #{session[:user_id]} and username #{@user.username} and password #{@user.password} is logged in!"
          redirect to('/')
  
        else
  
          @error_message = "Sorry, Login failed."
          #"login failed"  #this message doesnt show on browser unless it's the last thing it does, but will print in terminal
           erb(:login)
        end
       
        #"hello"  #shows up on login page
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
    p "User #{@username} saved!"
    redirect to('/login')
  
    erb(:signup) #temp line
  # go back to signup.erb page but include user saved message there
  else
  
    # display error messages
    #escape_html user.errors.full_messages
    #p user.errors.full_messages #debug prints error message from active record validation
    #p user.inspect
    erb(:signup) #goes back to signup page
  end
     end
  
      get '/logout' do
  
        if current_user
        session[:user_id] = nil
       p "logout successful, redirecting"
        redirect to('/login?logout=true')
        #"Logout successful for User with  username #{@user.username} and password #{@user.password}"  #this won't show up if session is clear, results in error
        #id #{@user.id}
        else
          session[:user_id] = nil #just in case
          redirect to('/login?nosessionlogout=true')  #user is not even logged in to begin with
          p "you haven't logged in initially, please log in again"
        end
  
      end
  
  
     
      get '/finstagram_posts/new' do
        @finstagram_post = FinstagramPost.new  #why do we need this line? pass errors from Actions.rb to the new.erb file
        erb(:"finstagram_posts/new")
      end
      
      post '/finstagram_posts' do
        photo_url = params[:photo_url]
        #p params.to_s
        @finstagram_post = FinstagramPost.new({ photo_url: photo_url, user_id: current_user.id })
      
        if @finstagram_post.save
          redirect(to('/'))
        else
          #@finstagram_post.errors.full_messages.inspect #no longer necessary, error messages will pass back to  new.erb below
          erb(:"finstagram_posts/new")
        end
      end
  
  
  
      get '/finstagram_posts/:id' do
        @finstagram_post = FinstagramPost.find(params[:id])   # find the finstagram post with the ID from the URL
        #escape_html @finstagram_post.inspect        # print to the screen for now
        erb(:"finstagram_posts/show")  
        
      end
  
      post '/comments' do
        # point values from params to variables
        text = params[:text]
        finstagram_post_id = params[:finstagram_post_id]
      
        # instantiate a comment with those values & assign the comment to the `current_user`
        comment = Comment.new({ text: text, finstagram_post_id: finstagram_post_id, user_id: current_user.id })
      
        # save the comment
        comment.save
      
        # `redirect` back to wherever we came from
        redirect(back)
      end
  
  
      post '/likes' do
        finstagram_post_id = params[:finstagram_post_id]
      
        like = Like.new({ finstagram_post_id: finstagram_post_id, user_id: current_user.id })
        like.save
      
        redirect(back)
      end
  
  
      delete '/likes/:id' do
        like = Like.find(params[:id])
        like.destroy
        redirect(back)
      end