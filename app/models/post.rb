class Post < ApplicationRecord
  
  validates :title, presence: true, length: { minimum: 2 }
  attachment :image
end
