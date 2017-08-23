class Image < ApplicationRecord
  validates :cat_id, :url, :ord, presence: true

  belongs_to :cat,
    primary_key: :id,
    foreign_key: :cat_id,
    class_name: :Cat
end
