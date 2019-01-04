class Session < ApplicationRecord
  validates :username, presence: true
  # validates_inclusion_of :password, in: 7..30
  validates :password, presence: true
  validates :password, confirmation: true
end
