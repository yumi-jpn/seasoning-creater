class Taste < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  
  with_options presence: true do
    validates :image
    validates :title
    validates :example
    validates :genre_id, numericality: { other_than: 1 }
    validates :user_id
  end
  
end
