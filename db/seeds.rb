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

CAT_URLS = [
  "https://s-media-cache-ak0.pinimg.com/736x/07/c3/c2/07c3c273e5d4c1f738e606d5826e319b--birman-cat-fluffy-cat.jpg",
  "https://i.pinimg.com/736x/a3/75/da/a375da2fe3f242c044a12f1b06bad12a--cats-meowing-pet-cats.jpg",
  "https://s-media-cache-ak0.pinimg.com/originals/5e/d5/07/5ed507dab4753809a8570fa82dc7f728.jpg",
  "https://i.pinimg.com/236x/7d/e0/c7/7de0c71ac1ea4568ae35a5e7fb91c5e4--american-curl-curls.jpg",
  "https://s-media-cache-ak0.pinimg.com/originals/60/03/45/600345e464a926d491ba1b2304c2e950.jpg",
  "https://s-media-cache-ak0.pinimg.com/736x/68/a6/1f/68a61f0e2d24dcb3d8ac0fbd769d41d3--rex-cornish-sphynx-cat.jpg",
  "https://s-media-cache-ak0.pinimg.com/originals/43/a2/89/43a289da79a48c79c1bbe8728e0ced3d.jpg",
  "https://i.pinimg.com/736x/7b/ae/ff/7baeff67da95740b8ff80bbdb4a55829--kitty-tattoos-writing-inspiration.jpg",
  "https://i.pinimg.com/736x/8e/5f/cb/8e5fcb75972c593f80f14adea48506a9--russian-blue-cats-grey-cats.jpg",
  "https://s-media-cache-ak0.pinimg.com/736x/72/d1/d0/72d1d08d5c930228b143af84f0328f4b--zulu-oriental-cat.jpg",
  "https://i.pinimg.com/236x/3c/2c/71/3c2c7150fd4fc332b8325497426e78ef--glass-tables-glass-coffee-tables.jpg",
  "http://www.petmd.com/sites/default/files/breedopedia/140514_01943.jpg",
  "https://s-media-cache-ak0.pinimg.com/236x/80/2c/66/802c668bb3b1ef567492bcdfa900c4a6--pedigree-cats-mists.jpg",
  "https://i.pinimg.com/736x/80/c4/84/80c484aa1faa235b526a8d05a35d3cf5--black-kitty-black-cats.jpg",
  "https://i.pinimg.com/736x/a7/2a/da/a72ada82eb4af961ec2922a8f1712098--cat-type-japanese-bobtail.jpg",
  "http://www.petmd.com/sites/default/files/breedopedia/IMG_0271_1.jpg",
  "https://s-media-cache-ak0.pinimg.com/originals/5a/c4/92/5ac492604635fca3485dffcb7dda3cd7.jpg",
  "https://i.pinimg.com/236x/77/90/ab/7790ab5012a3d073337ddec9cc78d1a5--turkish-van-cats-cat-tails.jpg",
  "https://i.pinimg.com/736x/9d/d6/b9/9dd6b902075af868b5956a2abb9f6afd--bobtail-cat-cat-breeds.jpg",
  "https://s-media-cache-ak0.pinimg.com/736x/df/9a/75/df9a75a9601a09b517e28f8f9aaf84b3--curly-hair-adorable-animals.jpg",
  "https://s-media-cache-ak0.pinimg.com/236x/4b/1d/25/4b1d257d0ac3a75a76cc16f05c61f62f--sirens-studio.jpg",
  "https://i.pinimg.com/736x/c4/6a/f3/c46af34a2e870ec4dcf9df9cef4c6f10--turkish-angora-cat-angora-cats.jpg",
  "https://s-media-cache-ak0.pinimg.com/736x/8f/d7/78/8fd7785778703b29c9f5a822ef49a639--polydactyl-cat-tabby-cats.jpg",
  "https://s-media-cache-ak0.pinimg.com/236x/a1/41/f7/a141f7c90a9e0ad89f311ca99bfd9a62.jpg",
  "https://i.pinimg.com/236x/d3/90/02/d39002e7276f806a21e58d9953a62f1b--chocolate-brown-havana-brown.jpg",
  "https://s-media-cache-ak0.pinimg.com/736x/5b/0f/f7/5b0ff7b81cb8c0c7617071ffef515a3e.jpg",
  "https://i.pinimg.com/736x/75/90/8b/75908bfe173e0d1d537df9e77c900638--balinese-cat-white-cats.jpg",
  "https://i.pinimg.com/236x/a1/8f/7d/a18f7db82788d53e1980c12b35b32524--the-pirate-northern-california.jpg",
  "https://i.pinimg.com/236x/68/d5/fb/68d5fb29cd8c5f9eaec8a90cafe27588--selkirk-rex-cat-irish.jpg",
  "https://s-media-cache-ak0.pinimg.com/736x/7c/09/8b/7c098b55440d8bf672ad0a0df49c12ce--cat-room-persian-cats.jpg",
  "https://s-media-cache-ak0.pinimg.com/736x/b8/24/37/b82437fd43cc2143e71c8f5db60da562--le-chat-kitty-cats.jpg",
  "https://i0.wp.com/www.themeowplace.com/wp-content/uploads/2016/09/IMG_20160816_215135.jpg?fit=1615%2C1615",
  "https://i.pinimg.com/736x/b3/08/00/b30800857bc2f29d9cb0e83160443eb5--pictures-of-animal-pictures.jpg",
  "https://s-media-cache-ak0.pinimg.com/originals/56/b5/f4/56b5f4a20bf16a338e746a12dddd43df.jpg",
  "https://i.pinimg.com/736x/40/88/a0/4088a0f24b8e10dcf695a3656db8ac70--siberian-cat-siberian-forest.jpg",
  "https://i.pinimg.com/736x/2e/20/83/2e20830977f1beb4878962b62bdb1871.jpg",
  "https://i.pinimg.com/736x/ef/28/73/ef28739e1644b2d5788505c9bd4ec0e7--crazy-cats-big-cats.jpg",
  "https://i.pinimg.com/236x/50/cd/d7/50cdd76a3cd1fab861b46de2692979cc--selkirk-rex-persian-cats.jpg",
  "https://s-media-cache-ak0.pinimg.com/originals/21/87/27/21872728392056c95e87971fa383db5a.jpg",
  "https://s-media-cache-ak0.pinimg.com/736x/21/e8/85/21e8853e751d3face2c8dc9201f0de9e--love-it-toys.jpg"
]

#Creates 40 seed cats with random names.

until Cat.count == 40 do
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
    cat_hash[:name] = Faker::Cat.name + " " + Faker::Name.last_name
    cat_hash[:description] = "#{cat_hash[:name]} is a #{adjective} #{breed} and is registered with #{registry}."
    break if Cat.create(cat_hash)
  end
end


#Create an Image for each cat using the Cat_URL constant

Cat.all.each_with_index do |cat, idx|
  options = {}
  options[:cat_id] = cat.id
  options[:ord] = 1
  options[:url] = CAT_URLS[idx]

  Image.create(options)
end



# NO LONGER USES SEARCH API TO SEED. #USES 40 DEFAULT CAT IMAGES

# def random_cat_image(cat)
#   descriptors = ['cat']
#   descriptors << cat.color
#   descriptors << cat.name.split.first
#   descriptors += cat.description.split[4..6]
#
#
#
#   # "cat brown cute arabian smooty"
#   query = descriptors.join(' ')
#
#
#   search = GoogleCustomSearchApi.search(query, searchType: "image")
#   picture_hash = search['items'].sample
#
#   picture_hash['link']
# end

# Cat.all.each do |cat|
#   options = {}
#
#   options[:cat_id] = cat.id
#   options[:ord] = 1
#   options[:url] = random_cat_image(cat)
#
#   Image.create(options)
# end
