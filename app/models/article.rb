class Article < ApplicationRecord

  belongs_to :user

  mount_uploader :image, ImageUploader

  enum category: { Cook: 1, Beauty: 2, Clean: 3, Other: 4 }, _prefix: true
  
end
