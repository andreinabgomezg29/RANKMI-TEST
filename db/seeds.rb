# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


parent = Tree.create(area: "Gerencia General", score: 7)
child = parent.children.create(area: "Gerencia Finanzas", score: 10)
child_2 = parent.children.create(area: "Gerencia Operaciones", score: 3)
child_2.children.create(area: "Gerencia Operaciones 1", score: 14)
child_2.children.create(area: "Gerencia Operaciones 2", score: 15)
