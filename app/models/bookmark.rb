class Bookmark < ApplicationRecord
  validates  :movie_id, uniqueness: {scope: :list_id}
  belongs_to :movie
  belongs_to :list
end
