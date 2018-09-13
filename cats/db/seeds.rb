# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)\

# CAT_COLORS = %w(black white orange brown grey silver).freeze

Cat.destroy_all

CatRentalRequest.destroy_all

percy = Cat.create!(name: 'Percy', sex: 'M', color: 'white', birth_date: '02/02/2017')
sparkle = Cat.create!(name: 'Sparkle', sex: 'M', color: 'silver', birth_date: '01/05/2016')
borubon = Cat.create!(name: 'Bourbon', sex: 'M', color: 'brown', birth_date: '03/04/2016')
samantha = Cat.create!(name: 'Samantha', sex: 'F', color: 'calico', birth_date: '09/04/2014')
