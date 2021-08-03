class Post < ApplicationRecord
  belongs_to :user
  has_many :comments

  acts_as_votable

  has_many_attached :photos
end
