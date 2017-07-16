class Genre < ApplicationRecord
  validates :name, presence:true, uniqueness: true
  has_many :movies

  def to_s
    self.name
  end
end
