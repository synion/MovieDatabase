class Movie < ApplicationRecord
  validates :name, presence: true
  validates :revenue, presence: true
end
