require_relative('../db/sql_runner')
require_relative('star')
require_relative('casting')

class Movie

  attr_accessor :title, :genre, :budget
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @genre = options['genre']
    @budget = options['budget']
  end

  def save()
    sql = "INSERT INTO movies (title, genre, budget)
    VALUES ($1,$2, $3)
    RETURNING id"
    values = [@title, @genre, @budget]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM movies"
    SqlRunner.run(sql)
  end

  def stars()
    sql = "SELECT stars.* FROM
    stars INNER JOIN casting
    ON stars.id = casting.star_id
    WHERE casting.movie_id = $1"
    values = [@id]
    star_hashes = SqlRunner.run(sql, values)
    return star_hashes.map {|star| Star.new(star)}
  end

  def budget_left()
    sql = "SELECT SUM(casting.fee) FROM
    casting INNER JOIN movies
    ON movies.id = casting.movie_id
    WHERE movies.id = $1"
    values = [@id]
    total_fees = SqlRunner.run(sql, values).first
    return @budget - total_fees['sum'].to_i
  end
end
