# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

categoie_names = %w(people nature objects places symbols)

categoie_names.each do |category_name|
  next if Category.named(category_name).exists?
  Category.create(name: category_name, position: (Category.maximum(:position) || -1) + 1)
end
