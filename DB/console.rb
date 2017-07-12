require( 'pry-byebug' )
require_relative( '../MODELS/artist.rb' )
require_relative( '../MODELS/album.rb' )

paul_mccartney = Artist.new( { 'name' => 'Paul McCartney' } )
paul_mccartney.save()

bob_dylan = Artist.new( { 'name' => 'Bob Dylan' } )
bob_dylan.save()

the_beatles= Artist.new( { 'name' => 'The Beatles' } )
the_beatles.save()

flowers_in_the_dirt = Album.new( { 'title' => "Flowers in the Dirt", 'genre' => "Rock", 'artist_id' => paul_mccartney.id() } )
flowers_in_the_dirt.save()

blood_on_the_tracks = Album.new( { 'title' => 'Blood On The Tracks', 'genre' => 'Folk', 'artist_id' => bob_dylan.id() } )
blood_on_the_tracks.save()

revolver = Album.new( { 'title' => 'The Beatles', 'genre' => 'Rock', 'artist_id' => the_beatles.id() } )
revolver.save()

all_artists = Artist.list()
all_albums = Album.list()
# fitd_artist = flowers_in_the_dirt.artist()
# bott_artist = blood_on_the_tracks.artist()
# rev_artist = revolver.artist()


bob_dylan.update( { 'name' => 'Bob Dylan' } )
blood_on_the_tracks.update( { 'genre' => 'Folk Rock' } )
all_artists = Artist.list()
all_albums = Album.list()

rod_stewart = Artist.new( { 'name' => 'Rod Stewart' } )
rod_stewart.save()
deleted_rs = rod_stewart.delete?()
deleted_ps = paul_mccartney.delete?()


flowers_in_the_dirt.delete()

# Should the delete methods above delete the object 
# as well as the entry in the database?



binding.pry
nil