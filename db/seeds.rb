# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



joke = Joke.create(title: "why did the chicken cross the road")
reply = Reply.create(content: "to get to the other side")

joke.replies << reply

joke.replies.create(content: "hi")