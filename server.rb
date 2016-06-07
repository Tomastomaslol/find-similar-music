require 'sinatra'
require 'spotify-client'
require './services/getartistid'

Find =  Find.new
SpotifyClient = Spotify::Client.new

puts 


set :haml, :format => :html5

get '/' do
	albums = SpotifyClient.artist_albums("15iVAtD3s3FsQR4w1v6M0P")
	haml :index, :locals => {:albums => albums["items"] }
end


post '/search/' do
	foundartist = Find.findartistid(params['search'])
	relatedartists = SpotifyClient.related_artists(foundartist[0].id)
	puts relatedartists
	haml :search, :locals => {:albums => relatedartists["artists"]}
end