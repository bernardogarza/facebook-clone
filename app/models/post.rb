# frozen_string_literal: true

class Post < ApplicationRecord
  validates :body, presence: true

  belongs_to :user

  has_many :likes, dependent: :destroy

  has_many :comments, dependent: :destroy
end
