# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Users::Models::User.create(name: "John Doe")
Users::Models::User.create(name: "Charlie Brown")
Users::Models::User.create(name: "Pablo Random")
Books::Models::Book.create(title: "The Hobbit")
Books::Models::Book.create(title: "The Lord of the Rings")
Books::Models::Book.create(title: "The Silmarillion")