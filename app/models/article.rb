class Article < ApplicationRecord

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end

  mount_uploader :image, ImageUploader

  enum category: { Cook: 1, Beauty: 2, Clean: 3, Other: 4 }, _prefix: true

  validates :title, presence: true
  validates :text, presence: true
  validates :image, presence: true
  
end
