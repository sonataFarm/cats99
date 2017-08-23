class Cat < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :sex, inclusion: { in: ['M', 'F'], message: 'Sex must be M or F' }

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


end
