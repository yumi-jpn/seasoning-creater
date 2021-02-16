class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :taste
  has_one_attached :image

  validates :comment, presence: true
end
