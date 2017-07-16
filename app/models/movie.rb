class Movie < ApplicationRecord
  validates :name, presence: true
  validates :revenue, presence: true
  belongs_to :genre
  has_and_belongs_to_many :actors
  accepts_nested_attributes_for :actors, :genre

  def to_s
    name
  end

  private
  def self.best_sell
    self.all.max_by { |movie| movie.revenue }
  end
end
