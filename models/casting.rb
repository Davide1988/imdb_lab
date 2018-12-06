require_relative('../db/sql_runner')
require_relative('star')
require_relative('movie')

class Casting

  attr_accessor :movie_id, :star_id
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @movie_id = options['movie_id'].to_i
    @star_id = options['star_id'].to_i
    @fee = options['fee']
  end

  def save()
    sql = "INSERT INTO casting (movie_id, star_id, fee)
    VALUES ($1,$2,$3)
    RETURNING id"
    values = [@movie_id, @star_id, @fee]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM casting"
    SqlRunner.run(sql)
  end
end
