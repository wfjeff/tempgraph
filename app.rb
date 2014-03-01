require 'sinatra'

class TempGraph < Sinatra::Base
  #put your route handlers here
  get '/' do 
    erb :tempgraph
  end

  post '/' do 
    erb :tempgraph
  end

  get '/about' do 
    erb :about
  end

  get '/hello' do 
    @name = params[:name]
    erb :hello
  end

  get '/:name' do 
    @name = params[:name]
    erb :hello
  end
end
