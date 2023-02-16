class Movie < ApplicationRecord
  # associations
  has_many :bookmarks
  # validations
  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true
end
