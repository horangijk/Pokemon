class User < ApplicationRecord
  has_many :pokeballs
  has_many :pokemons, through: :pokeballs
  validates_uniqueness_of :username
  # validates :password, length: {in: 7..20}
  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  def authenticate(password)
    BCrypt::Password.new(self.password_digest) == password
  end
  # has_secure_password - why doesn't this work? Does it have to do with my BCrypt?
end
