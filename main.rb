
require 'sinatra'

require 'active_support/all'
require 'active_record'



ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :host => "localhost",
  :username => "christopherhuyett",
  :password => "",
  :database => "breweries_and_beers"
)

ActiveRecord::Base.logger = Logger.new(STDOUT)

class Brewery < ActiveRecord::Base
  has_many :beer
end

class Beer < ActiveRecord::Base
  belongs_to :brewery
end

before do
  @nav_breweries = Brewery.all
end

#homepage
get '/' do
  erb :breweries

  
end

#list of breweries
get '/breweries' do
  erb :breweries

end

#create brewery
get '/breweries/form' do
  erb :form
end

post '/breweries' do 
  brewery = Brewery.new(params[:brewery])
  brewery.save
  redirect '/breweries'
end

#isolate a single brewery
get '/breweries/:brewery_id' do
  @brewery = Brewery.find(params[:brewery_id])
  erb :brewery
end

#update a single brewery
get '/breweries/edit/:brewery_id' do
  @brewery = Brewery.find(params[:brewery_id])
  erb :form
end

post '/breweries/:brewery_id' do
  brewery = Brewery.find(params[:brewery_id])
  brewery.update_attributes(params[:brewery])
  redirect '/breweries'
end

#delete brewery
post '/breweries/delete/:brewery_id' do
  brewery = Brewery.find(params[:brewery_id])
  brewery.destroy
  redirect '/breweries'
end

#beers
get '/breweries/new_beer/:brewery_id' do
  @brewery_id = params[:brewery_id]
  erb :new_beer
end

post '/breweries/create_beer/:brewery_id' do
  brewery = Brewery.find(params[:brewery_id])
  beer = brewery.beer.new
  beer.beer_name = params[:beer][:beer_name]
  beer.a_b_v = params[:beer][:a_b_v]
  beer.style = params[:beer][:style]
  beer.save

   ## OR ##
   #dog.toys << Toy.new(params[:toy])

  redirect '/breweries'
end












