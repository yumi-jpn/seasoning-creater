class Like < ApplicationRecord
  belongs_to :user
  belongs_to :taste

  with_options presence: true do
    validates :user_id
    validates :taste_id
  end
end
