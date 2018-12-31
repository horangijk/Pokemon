class Pokemon < ApplicationRecord
  has_many :pokeballs
  has_many :moves
  has_many :users, through: :pokeballs
end
