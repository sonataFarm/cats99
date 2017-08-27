class Cat < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :sex, inclusion: { in: ['M', 'F'], message: 'Sex must be M or F' }

  # after_initialize :get_cat_pics

  has_one :image,
    primary_key: :id,
    foreign_key: :cat_id,
    class_name: :Image


  def age_in_years
    today = Date.today
    ((today - birth_date) / 365).to_i
  end

  def selfie
    self.image.url
  end

  def find_cat
    if self.age_in_years >= 1
      descriptors = ['cat']
    else
      descriptors = ['kitten']
    end
     descriptors << self.color
     descriptors += self.description.split
     # "cat brown cute arabian smooty"
     query = descriptors.join(' ')

     search = GoogleCustomSearchApi.search(query, searchType: "image")
     picture_hash = search['items'].sample

     picture_hash['link']
  end

  def get_cat_pic
   options = {}

   options[:cat_id] = self.id
   options[:ord] = 1
   options[:url] = find_cat

   Image.create(options)
  end


end
