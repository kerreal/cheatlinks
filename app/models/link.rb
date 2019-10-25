class Link < ApplicationRecord
  validates :title, presence: true
  validates :link, presence: true
  validates :discription, presence: true

  belongs_to :user
end
