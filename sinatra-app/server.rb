require 'sinatra'
require './user_db'

get '/' do
  slim 'img src="https://i.pinimg.com/originals/85/a0/ed/85a0edc55fff61e462e47b60bb2f5ee0.jpg"'
end

get '/hello/:name' do
  name = params[:name]
  DB.insert(name: name, age: rand(1..100))
  slim 'p insert name in db'
  slim "p your age is #{DB.last.age}"
end
