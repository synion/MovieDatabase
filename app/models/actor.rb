class Actor < ApplicationRecord
   validates :first_name, presence: true
   validates :last_name, presence: true
   has_and_belongs_to_many :movies
   accepts_nested_attributes_for :movies

   def to_s
    self.decorate.full_name
   end
end
