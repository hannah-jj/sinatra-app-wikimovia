User.create(username: "user1", email: "user1@email.com", password: "password1")
User.create(username: "user2", email: "user2@email.com", password: "password2")
User.create(username: "user3", email: "user3@email.com", password: "password3")
User.create(username: "user4", email: "user4@email.com", password: "password4")
User.create(username: "user5", email: "user5@email.com", password: "password5")

Movie.create(pic_url: "https://images-na.ssl-images-amazon.com/images/M/MV5BMjI1MjkzMjczMV5BMl5BanBnXkFtZTgwNDk4NjYyMTI@._V1._SY209_CR0,0,140,209_.jpg", name: "Logan", year: 2017, description: "In the near future, a weary Logan cares for an ailing Professor X somewhere on the Mexican border. However, Logan's attempts to hide from the world and his legacy are upended when a young mutant arrives, pursued by dark forces.")
Movie.create(pic_url: "https://images-na.ssl-images-amazon.com/images/M/MV5BMTYzODYzODU2Ml5BMl5BanBnXkFtZTgwNTc1MTA2NzE@._V1._SY209_CR0,0,140,209_.jpg", name: "Sing", year: 2016, description: "In a city of humanoid animals, a hustling theater impresario's attempt to save his theater with a singing competition becomes grander than he anticipates even as its finalists' find that their lives will never be the same.")
Rating.create(star: 3, review: "cool, fun", user_id: 1, movie_id: 2)
Rating.create(star: 4, review: "not bad", user_id: 2, movie_id: 2) 
