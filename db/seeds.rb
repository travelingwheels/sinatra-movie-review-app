gary = User.create(name: "Gary", email: "gary@gary.com", password: "password")
christina = User.create(name: "Christina", email:"christina@christina.com", password: "password")

star_wars = Movie.create(name: "Star Wars")
hitchikers_guide_to_the_galaxy = Movie.create(name: "Hitchikers Guide to the Galaxy")
wizard_of_oz = Movie.create(name: "Wizard of Oz")
world_war_z = Movie.create(name: "World War Z")

Review.create(content: "Great movie!!", user_id: gary.id, movie_id: star_wars.id)
Review.create(content: "I liked it.", user_id: christina.id, movie_id: star_wars.id)
Review.create(content: "The more I see it, the more I like it", user_id: gary.id, movie_id: hitchikers_guide_to_the_galaxy.id)
Review.create(content: "Very fun to watch!", user_id: christina.id, movie_id: hitchikers_guide_to_the_galaxy.id)
Review.create(content: "I got scared by the end", user_id: gary.id, movie_id: wizard_of_oz.id)
Review.create(content: "A fun movie", user_id: christina.id, movie_id: world_war_z.id)
