class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :taste
  has_one_attached :image

  with_options presence: true do
    validates :comment
    validates :image
  end
end
