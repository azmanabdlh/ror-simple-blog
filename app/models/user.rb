class User < ApplicationRecord
  has_secure_password
  has_many :posts


  def welcome
    "Welcome #{self.name}"
  end
  
end
