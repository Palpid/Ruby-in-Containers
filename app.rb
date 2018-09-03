require 'sinatra'
require 'sinatra/base'

class MyApp < Sinatra::Base
  get '/' do
    "Welcome to sinatra in Containers"
  end
end
