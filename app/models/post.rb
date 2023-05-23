class Post < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  has_many   :comments, dependent: :destroy
  has_many   :likes, as: :likeable, dependent: :destroy
  validates  :content, presence: :true
  validates  :content, length: { minimum: 6}
end
