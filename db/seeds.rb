require_relative '../app/models/user.rb'
require_relative '../app/models/visit.rb'
require_relative '../app/models/shortened_url.rb'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

jeff = User.new(email: "jeff@gmail.com")
dax = User.new(email: "dax@gmail.com")
stacey = User.new(email: "stacey@gmail.com")
amy = User.new(email: "amy@gmail.com")
steve = User.new(email: "steve@gmail.com")

jeff.save
dax.save
stacey.save
amy.save
steve.save

u1 = jeff.shorten_url("www.google.com")
u2 = dax.shorten_url("www.espn.com")
u3 = dax.shorten_url("www.facebook.com")
u4 = stacey.shorten_url("www.twitter.com")
u5 = stacey.shorten_url("www.pinterest.com")
u6 = amy.shorten_url("www.gmail.com")
u7 = steve.shorten_url("www.apple.com")

Visit.record_visit!(jeff, u2)
Visit.record_visit!(jeff, u3)
Visit.record_visit!(jeff, u7)
Visit.record_visit!(dax, u7)
Visit.record_visit!(dax, u6)
Visit.record_visit!(dax, u5)
Visit.record_visit!(stacey, u7)
Visit.record_visit!(stacey, u3)
Visit.record_visit!(stacey, u1)
Visit.record_visit!(dax, u7)
Visit.record_visit!(steve, u1)
Visit.record_visit!(amy, u4)


