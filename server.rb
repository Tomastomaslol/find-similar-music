require 'sinatra'
require 'spotify-client'

SpotifyClient = Spotify::Client.new

set :haml, :format => :html5

get '/' do
	albums = SpotifyClient.artist_albums("15iVAtD3s3FsQR4w1v6M0P")
	puts albums.count
	haml :index, :locals => {:albums => albums["items"] }
end