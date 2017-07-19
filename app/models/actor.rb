class Actor < ApplicationRecord
   validates :first_name, presence: true
   validates :last_name, presence: true
   has_and_belongs_to_many :movies
   accepts_nested_attributes_for :movies

   def to_s
    self.decorate.full_name
   end

   def self.most_played
      self.find(most_played_id)
   end

   private
   def self.most_played_id
    self.joins(:movies).
         group(:id).
         count(:id).
         max_by {|id,movies| movies}[0]
   end
end
