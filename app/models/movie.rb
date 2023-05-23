class Movie < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy
end
