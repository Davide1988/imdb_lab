require_relative('../db/sql_runner')
require_relative('star')
require_relative('casting')

class Movie

  attr_accessor :title, :genre
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @genre = options['genre']
  end

  def save()
    sql = "INSERT INTO movies (title, genre)
    VALUES ($1,$2)
    RETURNING id"
    values = [@title, @genre]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM movies"
    SqlRunner.run(sql)
  end
end
