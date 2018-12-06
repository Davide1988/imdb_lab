require('pry')
require_relative('models/star')
require_relative('models/movie')

Casting.delete_all
Star.delete_all
Movie.delete_all

star1 = Star.new({'first_name' => 'Chris', 'last_name' => 'Pratt'})
star2 = Star.new({'first_name' => 'Jennifer', 'last_name' => 'Lawrence'})
star1.save
star2.save

movie1 = Movie.new({'title' => 'Guardians', 'genre' => 'Superhero'})
movie2 = Movie.new({'title' => 'Passenger', 'genre' => 'Sci-fi'})
movie3 = Movie.new({'title' => 'The Hunger Games', 'genre' => 'Sci-fi'})
movie4 = Movie.new({'title' => 'Jurassic World', 'genre' => 'Sci-fi'})
movie1.save
movie2.save
movie3.save
movie4.save
