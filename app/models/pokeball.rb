class Pokeball < ApplicationRecord
  belongs_to :pokemon
  belongs_to :user
  validates :pokemon, presence: true
  validates :user, presence: true
end
