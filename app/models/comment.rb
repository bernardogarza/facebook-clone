class Comment < ApplicationRecord
  validates :body, presence: true
  belongs_to :post
  belongs_to :user
end
