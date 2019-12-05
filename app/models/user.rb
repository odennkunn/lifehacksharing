class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :articles
  has_many :comments


  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :nickname, presence: true, uniqueness: true, length: { maximum: 10 }
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX, message: "フォーマットが不適切です"}
  
end
