gary = User.create(name: "Gary", email: "gary@gary.com", password: "password")
christina = User.create(name: "Christina", email:"christina@christina.com", password: "password")

Review.create(movie_name: "Star Wars", content: "Great movie!!", user_id: gary.id)
Review.create(movie_name: "Star Wars", content: "I liked it.", user_id: christina.id)
Review.create(movie_name: "Hitchikers_guide_to_the_galaxy", content: "The more I see it, the more I like it", user_id: gary.id)
Review.create(movie_name: "Hitchikers_guide_to_the_galaxy", content: "Very fun to watch!", user_id: christina.id)
Review.create(movie_name: "Wizard_of_oz", content: "I got scared by the end", user_id: gary.id)
Review.create(movie_name: "World_war_z", content: "A fun movie", user_id: christina.id)
