

# sinatra사용
# sinatra사용 리로드 해줘

# '/' 경로로 오면
# index.html 파일을 보내줘

#'/lunch' 경로로 오면
#@lunch.sample을
#erb에서 보여줘


require 'sinatra'
require 'sinatra/reloader'


get '/' do
    send_file 'views/index.html'
end

get '/lunch' do
    @lunch = ["멀캠20층","짜장면"]
    erb :lunch
end
