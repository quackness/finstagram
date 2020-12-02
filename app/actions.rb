# get '/page' do
#   File.read(File.join('app/views', 'index.html'))

# end
get '/' do
  @finstagram_posts = FinstagramPost.order(created_at: :desc)
  erb(:index)
end