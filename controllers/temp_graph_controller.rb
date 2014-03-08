class TempGraphController < App
  #put your route handlers here
  get '/' do 
    twine = Twine.create(name: "My Twine")
    Reading.create(temp: 74, twine: twine)
    sleep 1
    Reading.create(temp: 75, twine: twine)
    # @chart_hash = twine.chart_hash
    @chart_hash = {
      Time.new(2014,3,5,22) => 65,
      Time.new(2014,3,5,23) => 64,
      Time.new(2014,3,6,0) => 64,
      Time.new(2014,3,6,1) => 63,
      Time.new(2014,3,6,2) => 62,
      Time.new(2014,3,6,3) => 63,
      Time.new(2014,3,6,4) => 62,
      Time.new(2014,3,6,5) => 61,
      Time.new(2014,3,6,6) => 60,
    }
    # @range = twine.range(5)
    @range = {min: 55,max: 70}

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
