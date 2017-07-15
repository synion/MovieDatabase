class Movie < ApplicationRecord
  validates :name, presence: true
  validates :revenue, presence: true
  belongs_to :genre
  has_and_belongs_to_many :actors
end
