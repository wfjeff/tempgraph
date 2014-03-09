class TempGraphController < App
  #put your route handlers here
  get '/' do 
    twine = Twine.find_by(name: "My Twine")
    @chart_hash = twine.chart_hash
    @range = twine.range

    erb :tempgraph
  end

  # post '/' do 
  #   erb :tempgraph
  # end

  # get '/about' do 
  #   erb :about
  # end

  # get '/hello' do 
  #   @name = params[:name]
  #   erb :hello
  # end

  # get '/:name' do 
  #   @name = params[:name]
  #   erb :hello
  # end
end
