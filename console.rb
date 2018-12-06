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

movie1 = Movie.new({'title' => 'Guardians', 'genre' => 'Superhero', 'budget' => 30})
movie2 = Movie.new({'title' => 'Passenger', 'genre' => 'Sci-fi', 'budget' => 40})
movie3 = Movie.new({'title' => 'The Hunger Games', 'genre' => 'Sci-fi', 'budget' => 10})
movie4 = Movie.new({'title' => 'Jurassic World', 'genre' => 'Sci-fi', 'budget' => 10})
movie1.save
movie2.save
movie3.save
movie4.save

casting1 = Casting.new({'movie_id' => movie1.id, 'star_id' => star1.id, 'fee' => 10})
casting1.save
casting2 = Casting.new({'movie_id' => movie2.id, 'star_id' => star1.id, 'fee' => 3})
casting2.save
casting3 = Casting.new({'movie_id' => movie2.id, 'star_id' => star2.id, 'fee' => 4})
casting3.save
guardians_stars = movie1.stars
p movie2.budget_left
binding.pry
nil
