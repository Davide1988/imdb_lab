require('../db/sql_runner')
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
end
