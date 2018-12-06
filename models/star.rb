require_relative('../db/sql_runner')
require_relative('movie')
require_relative('casting')

class Star

  attr_accessor :first_name, :last_name
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
  end

  def save()
    sql = "INSERT INTO stars (first_name, last_name)
    VALUES ($1,$2)
    RETURNING id"
    values = [@first_name, @last_name]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM stars"
    SqlRunner.run(sql)
  end

  def movies()
    sql = "SELECT movies.* FROM
    movies INNER JOIN casting
    ON movies.id = casting.movie_id
    WHERE casting.star_id = $1"
    values = [@id]
    movie_hashes = SqlRunner.run(sql, values)
    return movie_hashes.map {|movie| Movie.new(movie)}
  end
end
