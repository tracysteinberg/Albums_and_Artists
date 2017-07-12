require_relative( '../DB/sql_runner.rb' )

class Album

  attr_reader :id, :title, :genre, :artist_id

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i
  end

  def save()
    sql = "INSERT INTO albums ( title, genre, artist_id ) VALUES ( '#{@title}', '#{@genre}', #{@artist_id} ) RETURNING id;"
    result = SqlRunner.run( sql )
    @id = result[0]['id'].to_i
  end

  def artist()
    sql = "SELECT * FROM artists WHERE id = #{@artist_id};"
    result = SqlRunner.run( sql )
    return Artist.new( result[0] )
  end

  def update( new_options )
    #Update only those fields we are given in the method call
    @title = new_options['title'] if new_options['title']
    @genre = new_options['genre'] if new_options['genre']
    @artist_id = new_options['artist_id'].to_i if new_options['artist_id']
    sql = "UPDATE albums SET ( title, genre, artist_id ) = ( '#{@title}', '#{@genre}', #{@artist_id} ) WHERE id = #{@id};"
    SqlRunner.run( sql )
  end

  def self.list
    sql = "SELECT * FROM albums;"
    result = SqlRunner.run( sql )
    return result.map { |album| Album.new( album ) }
  end

end