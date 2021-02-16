class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :taste

  validates :comment, presence: true
end
