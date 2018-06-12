#kjihoon0914:~/workspace/sinatra (master) $ ruby app.rb -o $IP
#/usr/local/rvm/rubies/ruby-2.4.0/lib/ruby/2.4.0/rubygems/specification.rb:2288:in `raise_if_conflicts': Unable to activate dm-serializer-1.2.2, 
#because json-2.0.2 conflicts with json (~> 1.6) (Gem::ConflictError)
#위 error 때문에 아래 한줄 작성
gem 'json', '~>1.6' #fix json version 


require 'sinatra'
require 'sinatra/reloader'
require 'data_mapper' # metagem, requires common plugins too.

before do
    p '********************************'
    p params
    p '********************************'    
end


########################################################Data Mapper
#datamapper
DataMapper::Logger.new($stdout,:debug)
# need install dm-sqlite-adapter
DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/blog.db")

class Post
  include DataMapper::Resource
  property :id, Serial
  property :title, String
  property :body, Text
  property :created_at, DateTime
end

# Perform basic sanity checks and initialize all relationships
# Call this when you've defined all your models
DataMapper.finalize

# automatically create the post table
Post.auto_upgrade!
########################################################

get '/' do
    send_file 'views/index.html'
end

get '/lunch' do
    @lunch = ["멀캠20층","짜장면"]
    erb :lunch
end


#게시글 view
get '/posts/posts' do
      #@posts = Post.all
      @posts = Post.all(:order => [ :id.desc ], :limit => 10)
    erb :'posts/posts'
end


get '/posts/new' do
    erb :'posts/new'
end


get '/posts/create' do
    @title =params[:title]
    @body =params[:body]
    Post.create(title:@title,body:@body)
    erb :'posts/contents'
end

get '/posts/:id' do
    @id = params[:id]
    @post =Post.get(@id)
    erb:'posts/show'
end
