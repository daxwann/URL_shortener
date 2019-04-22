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

jeff = User.create!(email: "jeff@gmail.com")
dax = User.create!(email: "dax@gmail.com")
stacey = User.create!(email: "stacey@gmail.com")
amy = User.create!(email: "amy@gmail.com")
steve = User.create!(email: "steve@gmail.com")

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

social = TagTopic.create!(name: 'Social media')
sports = TagTopic.create!(name: 'Sports')
mail = TagTopic.create!(name: 'Mail')
tech = TagTopic.create!(name: 'Technology')
search = TagTopic.create!(name: 'Search')

Tagging.create!(url_id: u1.id, topic_id: search.id)
Tagging.create!(url_id: u1.id, topic_id: tech.id)
Tagging.create!(url_id: u2.id, topic_id: sports.id)
Tagging.create!(url_id: u3.id, topic_id: social.id)
Tagging.create!(url_id: u4.id, topic_id: social.id)
Tagging.create!(url_id: u5.id, topic_id: social.id)
Tagging.create!(url_id: u6.id, topic_id: mail.id)
Tagging.create!(url_id: u7.id, topic_id: tech.id)

