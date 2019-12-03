class Comment < ApplicationRecord
  belongs_to :post

  validates :text, presence: true,
              length: { in: 1..84, message: "の入力は最大84文字までです"}
end
