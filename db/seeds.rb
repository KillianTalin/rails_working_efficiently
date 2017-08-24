# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Cleaning database...'
Task.destroy_all
Project.destroy_all
User.destroy_all

puts 'Creating users...'
users_attributes = [
  {
    email:      "killian.talin@gmail.com",
    password:   "123456",
    first_name: "Killian",
    last_name:  "Talin",
    photo: "https://media.licdn.com/mpr/mpr/shrinknp_200_200/AAEAAQAAAAAAAARFAAAAJDgwZDNiZjI0LTQ3MDctNDcxYS04YjU4LTI5ZDcxM2RhZjRhYQ.jpg"
  },
  {
    email:      "julien.colletas@gmail.com",
    password:   "123456",
    first_name: "Julien",
    last_name:  "Colletas",
    photo: "https://media.licdn.com/mpr/mpr/shrinknp_200_200/p/7/005/096/3ed/38ea278.jpg"
  }
]
User.create!(users_attributes)

puts 'Creating projects...'
projects_attributes = [
  {
    user: User.first,
    name: "Faire un site pour Poulpe",
    start_date: 20170320,
    end_date: 20170820,
    total_worktime: 4.2
  }
]
Project.create!(projects_attributes)

puts 'Creating tasks...'
tasks_attributes = [
  {
    name: "Finir le cahier des charges",
    project: Project.first,
    user: User.first,
    mit_task: true,
    secondary_task: false
  },
  {
    name: "Réaliser le DB model",
    forecast_duration: 60,
    project: Project.first,
    user: User.first,
    mit_task: false,
    secondary_task: true
  }
]
Task.create!(tasks_attributes)
puts 'Finished!'
