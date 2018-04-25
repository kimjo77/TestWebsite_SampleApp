class User < ApplicationRecord
  VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  before_save {self.email.downcase!}
  validates :name,  presence: true, length: {maximum: 50}
  validates :email, presence: true, length: {maximum: 255}, 
            format: {with: VALID_EMAIL},
            uniqueness: {case_sensitive: false}
  has_secure_password
  validates :password, presence: true, length: {minimum: 6}     
end