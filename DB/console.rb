require( 'pry-byebug' )
require_relative( '../MODELS/artist.rb' )
require_relative( '../MODELS/album.rb' )

paul_mccartney = Artist.new( { 'name' => 'Paul McCartney' } )
paul_mccartney.save()

suzanne_vega = Artist.new( { 'name' => 'Suzanne Vega' } )
suzanne_vega.save()

flowers_in_the_dirt = Album.new( { 'title' => "Flowers in the Dirt", 'genre' => "Rock", 'artist_id' => paul_mccartney.id() } )
flowers_in_the_dirt.save()

days_of_open_hand = Album.new( { 'title' => 'Days of Open Hand', 'genre' => 'Folk', 'artist_id' => suzanne_vega.id() } )
days_of_open_hand.save()

solitude_standing = Album.new( { 'title' => 'Solitude Standing', 'genre' => 'Folk', 'artist_id' => suzanne_vega.id() } )
solitude_standing.save()

all_artists = Artist.list()
all_albums = Album.list()
vega_albums = suzanne_vega.albums()
fitd_artist = flowers_in_the_dirt.artist()

suzanne_vega.update( { 'name' => 'Suzanne Vogon' } )
solitude_standing.update( { 'genre' => 'Folk Rock' } )
all_artists = Artist.list()
all_albums = Album.list()

binding.pry
null