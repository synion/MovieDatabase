# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
10.times do
  Genre.create( name: Faker::Book.genre )
end

genres = Genre.all

100.times {
  Movie.create( name: Faker::Book.title, revenue: Faker::Number.number(5).to_i , genre_id: genres.sample.id)
}

movies = Movie.all

300.times  {
  Actor.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
}

actors = Actor.all

actors.each do |actor|
  actor.movies << movies.sample(rand(1..40))
end

movies.each do |movie|
  movie.actors << actors.sample(rand(1..15))
end

puts "Seed end"
