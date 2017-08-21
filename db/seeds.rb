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
  # {
  #   email:      "etienne.porche@gmail.com",
  #   password:   "123456",
  #   first_name: "Etienne",
  #   last_name:  "Porche",
  #   photo: "https://static1.squarespace.com/static/56640987e4b0d6ae9d0ef8a9/t/56643040e4b00c1d30b3d89d/1449406551711/"
  # },
  {
    email:      "julien.colletas@gmail.com",
    password:   "123456",
    first_name: "Julien",
    last_name:  "Colletas",
    photo: "https://media.licdn.com/mpr/mpr/shrinknp_200_200/p/7/005/096/3ed/38ea278.jpg"
  }
]
User.create!(users_attributes)

puts 'Creating tasks...'
chalets_attributes = [
  {
    name:            "Finir le cahier des charges",
    forecast_duration: 60,
    real_duration: 50,
    category: "MIT"
    productivity_score: 4
    starts_at:
    ends_at:
  },
  {
    name:            "Refuge du Goûter",
    capacity:        120,
    city:            "Saint-Gervais-les-Bains",
    location:        "Massif du Mont-Blanc",
    latitude:        45.851060,
    longitude:       6.830066,
    altitude:        3835,
    rating:          4,
    price:           60,
    cb_accepted:     true,
    opening_date:    20170320,
    closing_date:    20170830,
    user:            User.all.sample,
    last_renovation: "14 janvier 2014",
    description:     "Le plus haut refuge gardé en France, quasiment sur le sommet de l'Aiguille du Goûter. Les couchers de soleil y sont intéressants, mais les nuits brèves. Le nouveau refuge est un bâtiment aux normes Haute Qualité Environnementale (HQE).",
    photo_urls: ['http://www.france-montagnes.com/sites/default/files/activite/projet_refuge_du_gouter.jpg']
  },
  {
    name:            "Refuge de Tête Rousse",
    capacity:        74,
    city:            "Saint-Gervais-les-Bains",
    location:        "Massif du Mont-Blanc",
    latitude:        45.854925,
    longitude:       6.817477,
    altitude:        3167,
    rating:          3,
    price:           100,
    cb_accepted:     true,
    opening_date:    20170320,
    closing_date:    20170830,
    user:            User.all.sample,
    last_renovation: "14 janvier 2003",
    description:     "Dans un site de Haute montagne, près du petit glacier de Tête Rousse et face à la très belle face NW de l'Aiguille de Bionnassay, un très beau et très confortable refuge (rénové en 2003).",
    photo_urls: ['http://magdescimes.com/wp-content/uploads/2012/07/25156292452_10151047309892453.jpg']

  },
  {
    name:            "Refuge Vallot",
    capacity:        130,
    city:            "Saint-Gervais-les-Bains",
    location:        "Massif du Mont-Blanc",
    latitude:        45.83916,
    longitude:       6.85207,
    altitude:        4365,
    rating:          2,
    price:           20,
    cb_accepted:     true,
    opening_date:    20170320,
    closing_date:    20170830,
    user:            User.all.sample,
    last_renovation: "14 janvier 2014",
    description:     "L'Abri VALLOT est un lieu de secours pour les alpinistes en difficulté (notamment ceux sortant des voies sud du Mont-Blanc). Il n'est pas destiné à l'hébergement régulier des alpinistes candidats au Mont-Blanc. Merci de respecter ces dispositions.",
    photo_urls: ['https://media.camptocamp.org/c2corg_active/1377244675_742558861.jpg']
  },
  {
    name:            "Refuge Robert-Blanc",
    capacity:        130,
    city:            "Bourg Saint-Maurice",
    location:        "Massif du Mont-Blanc",
    latitude:        45.83916,
    longitude:       6.85207,
    altitude:        4365,
    rating:          3,
    price:           100,
    cb_accepted:     true,
    opening_date:    20170320,
    closing_date:    20170830,
    user:            User.all.sample,
    last_renovation: "14 janvier 2014",
    description:     "Le refuge Robert Blanc se situe à 2750 m d’altitude, en Savoie, sur la commune de Bourg-Saint-Maurice, sur une variante du tour du Mont-Blanc, au pied de l’Aiguille des Glaciers.",
    photo_urls:      ['http://media.sit.savoie-mont-blanc.com/original/566689/4-1535764.jpg']
  },
  {
    name:            "Refuge d'Argentière'",
    capacity:        130,
    city:            "Chamonix-Mont-Blanc",
    location:        "Massif du Mont-Blanc",
    latitude:        45.946309,
    longitude:       7.004766,
    altitude:        2771,
    rating:          3,
    price:           100,
    cb_accepted:     true,
    opening_date:    20170320,
    closing_date:    20170830,
    user:            User.all.sample,
    last_renovation: "14 janvier 2014",
    description:     "Un refuge d'aspect inhabituel avec son niveau supérieur en encorbellement et réchauffé par son bardage sapin.Site «Haute Montagne» neige, rocs et glace. Une vue particulièrement impressionnante des faces nord de la chaîne allant de l'Aiguille verte au Mont Dolent.",
    photo_urls: ['http://img-4.linternaute.com/F69HGXKdvh81SnCnRiLmxP7sFBQ=/1240x/smart/image-cms/10255074.jpg']
},

  {
    name:            "Refuge l'Alpage",
    capacity:        100,
    city:            "Arèches",
    location:        "Massif du Beaufortain",
    latitude:        45.649597,
    longitude:       6.564803,
    altitude:        3613,
    rating:          3,
    price:           50,
    cb_accepted:     true,
    opening_date:    20170320,
    closing_date:    20170830,
    user:            User.all.sample,
    last_renovation: "14 janvier 2014",
    description:     "Dans le massif du Grand-Mont, au chalets les Rognoux, sur les pistes de ski d'Arêches. Le refuge se compose de 3 chambres de 4 pers et de 1 dortoire de 12 pers. Les duvet et couverture sont fournis.",
    photo_urls: ['http://montagne-oisans.com/wp-content/modules/module_sliders/contenu/images/1_3.jpg']
  },
  {
    name:            "Refuge le Nant du Beurre ",
    capacity:        30,
    city:            "73270 Beaufort",
    location:        "Massif du Beaufortain",
    latitude:        45.582882,
    longitude:       6.560423,
    altitude:        3835,
    rating:          4,
    price:           60,
    cb_accepted:     true,
    opening_date:    20170320,
    closing_date:    20170830,
    user:            User.all.sample,
    last_renovation: "14 janvier 2014",
    description:     "Situé sur une vallée ouverte et ensoleillée, il offre un vue exceptionnelle sur les autres massifs : Lauzière, Cheval noir, Vanoise, plus au loin, Meije, Ecrins...Ces couchers de soleil sur la Lauzière restent un beau cadeau ! Lieu sauvage et paisible qui vous convie à la contemplation.
                      L'hiver vous pouvez venir en ski de fond (le refuge est situé sur le domaine nordique de Grand Naves 73260), en raquette, ski de randonnée, chien de traineau.",
    photo_urls: ['http://montagne-oisans.com/wp-content/modules/module_sliders/contenu/images/1_80.jpg']
  },
  {
    name:            "Refuge de la Croix de fer",
    capacity:        84,
    city:            "Sallanches",
    location:        "Massif du Beaufortain",
    latitude:        45.795197,
    longitude:       6.610345,
    altitude:        3167,
    rating:          3,
    price:           100,
    cb_accepted:     true,
    opening_date:    20170320,
    closing_date:    20170830,
    user:            User.all.sample,
    last_renovation: "14 janvier 2014",
    description:     "De moins en moins isolé du fait de l'extension du domaine skiable de Saint-Sorlin, le refuge reste un bel objectif de balade dans un environnement de haute montagne.",
    photo_urls: ['http://www.lesothers.com/wp-content/uploads/2017/03/gervasutti.jpg']

  },
  {
    name:            "Refuge du Col de la Croix",
    capacity:        66,
    city:            "Megève",
    location:        "Massif du Beaufortain",
    latitude:        45.722057,
    longitude:       6.717266,
    altitude:        1867,
    rating:          3,
    price:           20,
    cb_accepted:     true,
    opening_date:    20170320,
    closing_date:    20170830,
    user:            User.all.sample,
    last_renovation: "14 janvier 2014",
    description:     "Interessant pour faire une etape autour de ces endroits magnifiques que sont le col du Lauzon et les aguilles de la Jarjatte. Meme s'il est un peu bas/pas très sauvage.",
    photo_urls: ['http://www.lesothers.com/wp-content/uploads/2017/03/refuge-INSOLITE-EN-slov%C3%A8nie.jpg']
  }
]
Chalet.create!(chalets_attributes)
puts 'Finished!'
