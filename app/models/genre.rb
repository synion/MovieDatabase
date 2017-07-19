class Genre < ApplicationRecord
  validates :name, presence:true, uniqueness: true
  has_many :movies

  def to_s
    self.name
  end

  def self.most_popular
    self.find(most_popular_id)
  end

  private
  def self.most_popular_id
    self.joins(:movies).
         group(:id).
         count.
         max_by { |genre_id,numbers| numbers}[0]
  end
end
