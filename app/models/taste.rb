class Taste < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :taste_seasonings
  accepts_nested_attributes_for :taste_seasonings

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre

  with_options presence: true do
    validates :image
    validates :title
    validates :example
    validates :recipe
    validates :genre_id, numericality: { other_than: 1 }
  end
end
