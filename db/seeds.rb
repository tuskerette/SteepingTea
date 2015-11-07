# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Song.destroy_all
Song.create(url: "https://www.youtube.com/watch?v=suQBZzcO0TQ", comment:"cool", duration: 191)
Song.create(url: "https://www.youtube.com/watch?v=xTo79sPCVXA", comment:"nice", duration: 177)
Song.create(url: "https://www.youtube.com/watch?v=YrL26-U4cCg", comment:"short", duration: 72)
puts "created three songs"
