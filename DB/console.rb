require( 'pry-byebug' )
require_relative( '../MODELS/artist.rb' )
require_relative( '../MODELS/album.rb' )

paul_mccartney = Artist.new( { 'name' => 'Paul McCartney'} )

paul_mccartney.save()

binding.pry

flowers_in_the_dirt = Album.new( { 'title' => "Flowers in the Dirt", 'genre' => "Rock", 'artist_id' => paul_mccartney.id() } )

flowers_in_the_dirt.save()

binding.pry
nul