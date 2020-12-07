# get '/page' do
#   File.read(File.join('app/views', 'index.html'))

# end
get '/' do
  @finstagram_posts = FinstagramPost.order(created_at: :desc)
  erb(:index)
end

get '/signup' do # if user navigates to the path /signup
    @user = User.new # setup empty @user object
    erb(:signup)  # render from "app/views/signup.erb"
end

post '/signup' do
    # grab user input values from params 
    email = params[:email]
    avatar_url = params[:avatar_url]
    username = params[:username]
    password = params[:password]

    # if all user params are present
    # deactivated if email.present? && avatar_url.present? && username.present? && password.present?

    #instantite and save a user
    @user = User.new({ email: email, avatar_url: avatar_url, username: username, password: password })
    
    if @user.save
        "User #{username} saved!"

    # return readable representation of User object
    # deactivated escape_html user.inspect
    else
        erb(:signup)
    end
end