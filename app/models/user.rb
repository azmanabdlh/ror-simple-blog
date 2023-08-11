class User < ApplicationRecord
  has_secure_password
  has_many :posts
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 8 }


  def welcome
    "Welcome #{self.name}"
  end
  
end
