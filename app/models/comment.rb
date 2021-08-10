class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :content, presence: true
  validates :content, length: { minimum: 1, maximum: 250 }

  acts_as_votable
end
