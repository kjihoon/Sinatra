source 'https://rubygems.org'
gem 'sinatra'
gem 'sinatra-reloader'
gem 'datamapper'

gem 'bcrypt'


#배포전용
group :production do
    gem 'pg'
    gem 'dm-postgres-adapter'
end

#debug 전용
#개발환경 전용
group :development, :test do
    gem 'dm-sqlite-adapter'
    
end