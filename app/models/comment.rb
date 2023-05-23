class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many   :likes, as: :likeable, dependent: :destroy
  validates  :content, presence: :true
  validates  :content, length: { minimum: 6}
end
