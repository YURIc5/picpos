class Post < ApplicationRecord
  mount_uploader :picture, PictureUploader
  has_many :comments, dependent: :destroy
  
  validates :picture, presence: true
  validates :text, presence: true,
              length: { in: 1..84, message: "の入力は最大84文字までです"}
end
