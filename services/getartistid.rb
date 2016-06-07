require_relative '../models/artist'

class Find
	def findartistid(artistName)
		searchResults = SpotifyClient.search("artist", artistName)
		results = Array.new
		searchResults["artists"]["items"].each do |artist|
			@artist = Artist.new
			@artist.name = artist["name"]
			@artist.id = artist["id"]
			results.push(@artist)
		end
		results
	end
end
