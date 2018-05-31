require 'sinatra'
require 'slim'

get '/' do
  slim :'hello/index'
end
