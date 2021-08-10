class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :delete_all

  validates :content, presence: true
  validates :content, length: { minimum: 1, maximum: 550 }

  acts_as_votable

  has_many_attached :photos
end
