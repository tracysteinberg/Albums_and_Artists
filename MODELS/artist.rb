require_relative( '../DB/sql_runner.rb' )

class Artist

  attr_reader :id, :name

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO artists (name) VALUES ('#{@name}') RETURNING id;"
    result = SqlRunner.run( sql )
    @id = result[0]['id'].to_i
  end

  def albums()
    sql = "SELECT * FROM albums WHERE artist_id = #{@id};"
    result = SqlRunner.run( sql )
    return result.map { |album| Album.new( album ) }
  end

  def update( new_options )
    @name = new_options['name']
    sql = "UPDATE artists SET name = '#{@name}' WHERE id = #{@id};"
    SqlRunner.run( sql )
  end

  def delete?()
    sql = "SELECT * FROM albums WHERE artist_id = #{@id}"
    result = SqlRunner.run( sql )
    if ( result.count() == 0 )
      sql = "DELETE FROM artists WHERE id = #{@id};"
      SqlRunner.run( sql )
      return true
    else
      return false
    end
    # Should we also delete associated object?
  end

  def self.list
    sql = "SELECT * FROM artists;"
    result = SqlRunner.run( sql )
    return result.map { |artist| Artist.new( artist ) }
  end

end