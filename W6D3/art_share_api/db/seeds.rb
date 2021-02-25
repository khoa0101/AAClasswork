# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



User.delete_all
Artwork.delete_all
ArtworkShare.delete_all

user1 = User.create({username: "jeffrey"})
user2 = User.create({username: "artman"})
user3 = User.create({username: "artluvr"})

artwork1 = Artwork.create({artist_id: user2.id, title: "Bob Ross Trees", img_url: "bob_ross.com/image/4"})
artwork2 = Artwork.create({artist_id: user2.id, title: "Bob Ross Mountains", img_url: "bob_ross.com/image/5"})

share1 = ArtworkShare.create({artwork_id: artwork1.id, viewer_id: user3.id})
share2 = ArtworkShare.create({artwork_id: artwork1.id, viewer_id: user1.id})

share3 = ArtworkShare.create({artwork_id: artwork2.id, viewer_id: user3.id})
share4 = ArtworkShare.create({artwork_id: artwork2.id, viewer_id: user1.id})
share5 = ArtworkShare.create({artwork_id: artwork2.id, viewer_id: user2.id})

