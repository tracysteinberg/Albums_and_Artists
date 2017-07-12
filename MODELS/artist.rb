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

end