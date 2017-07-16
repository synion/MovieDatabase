class Genre < ApplicationRecord
  validates :name, presence:true, uniqueness: true
  has_many :movies

  def to_s
    self.name
  end

  def self.most_popular
    self.all.max_by { |genre| genre.movies.size }
  end
end
