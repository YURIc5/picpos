class Post < ApplicationRecord
  mount_uploader :picture, PictureUploader

  validates :picture, presence: true
  validates :text, presence: true,
              length: { in: 1..75, message: "の入力は最大84文字までです"}
end
