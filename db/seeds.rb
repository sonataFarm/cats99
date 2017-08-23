require 'faker'
require 'pry'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Cat.delete_all
Image.delete_all

def random_cat_image(cat)
  descriptors = ['cat']
  descriptors << cat.color
  descriptors << cat.name
  descriptors << cat.name
  descriptors += cat.description.split[3..4]

  # "cat brown cute arabian smooty"
  query = descriptors.join(' ')

  search = GoogleCustomSearchApi.search(query, searchType: "image")
  # binding.pry
  picture_hash = search['items'].sample

  picture_hash['link']
end

until Cat.count == 26 do
  cat_hash = {}

  cat_hash[:sex] = %w[M F].sample

  ten_years_ago = Date.new(2007, 1, 1)
  today = Date.today
  cat_hash[:birth_date] = Faker::Date.between(ten_years_ago, today)
  cat_hash[:color] = %w[black orange grey white brown calico].sample

  breed = Faker::Cat.breed
  registry = Faker::Cat.registry
  adjective = %w[cute funny sweet fluffy sassy huggable smelly cuddly smart rabid frenzied street-wise].sample

  loop do
    cat_hash[:name] = Faker::Cat.name
    cat_hash[:description] = "#{cat_hash[:name]} is a #{adjective} #{breed} and is registered with #{registry}."
    break if Cat.create(cat_hash)
  end
end

Cat.all.each do |cat|
  options = {}

  options[:cat_id] = cat.id
  options[:ord] = 1
  options[:url] = random_cat_image(cat)

  Image.create(options)
end
