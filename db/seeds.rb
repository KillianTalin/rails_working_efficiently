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
Client.destroy_all

puts 'Creating users...'
users_attributes = [
{
    email:      "amin.diez@gmail.com",
    password:   "123456",
    first_name: "Amin",
    last_name:  "Bouhassoune",
    photo: "https://media.licdn.com/mpr/mpr/shrinknp_200_200/AAEAAQAAAAAAAARFAAAAJDgwZDNiZjI0LTQ3MDctNDcxYS04YjU4LTI5ZDcxM2RhZjRhYQ.jpg"
  },
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

puts 'creating clients...'
clients_attributes = [
{
  name: "André Dufour"
  },
  {
  name: "Jean paul"
  }
]
Client.create!(clients_attributes)

puts 'Creating projects...'
projects_attributes = [
  {
    user: User.first,
    client: Client.first,
    name: "Fnac - Faire un site ecommerce",
    price_per_day: 400,
    end_date: 20171009
  },
    {
    user: User.first,
    client: Client.last,
    name: "Aircall - Refaire l'intranet",
    price_per_day: 200,
    end_date: 20171009
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
    secondary_task: false,
    elapsed_time: 3600,
    done: false,
    selected: false,
    estimation: "2000-01-01 01:30:00 UTC",
    done: false,
  },
  {
    name: "Réaliser la database",
    project: Project.first,
    user: User.first,
    secondary_task: false,
    elapsed_time: 3600,
    done: false,
    selected: false,
    estimation: "2000-01-01 01:30:00 UTC",
    done: false,
  }
]
Task.create!(tasks_attributes)
puts 'Finished!'
