require 'sinatra'
require 'sinatra/reloader'
require 'chuck_norris'

get '/' do
  "hello world"
end

get '/:type' do
  if params[:type] == "nerdy"
    @nerdy_joke = ChuckNorris::JokeFinder.find_joke('random?limitTo=[nerdy]').joke
    erb :nerdy
  elsif params[:type] == "nsfw"
    @nsfw_joke = ChuckNorris::JokeFinder.find_joke('random?limitTo=[explicit]').joke
    erb :nsfw
  end
end
