#kjihoon0914:~/workspace/sinatra (master) $ ruby app.rb -o $IP
#/usr/local/rvm/rubies/ruby-2.4.0/lib/ruby/2.4.0/rubygems/specification.rb:2288:in `raise_if_conflicts': Unable to activate dm-serializer-1.2.2, 
#because json-2.0.2 conflicts with json (~> 1.6) (Gem::ConflictError)
#위 error 때문에 아래 한줄 작성
#gem 'json', '~>1.6' #fix json version 

require 'sinatra'
require 'sinatra/reloader'
require "./model.rb"
before do
    p '********************************'
    p params
    p '********************************'    
end


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


get '/posts/destroy/:id' do
  Post.get(params[:id]).destroy
  # erb :'posts/destroy'
  redirect '/posts'
end



#값을 받아 뿌려주기 위한 용도
get '/posts/edit/:id' do
    @id = params[:id]
    @post = Post.get(@id)
    erb :'posts/edit'
end


get '/posts/update/:id' do
  @id = params[:id]
  Post.get(@id).update(title: params[:title], body: params[:body])
  redirect '/posts/'+@id
end



