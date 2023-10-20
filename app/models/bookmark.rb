class Bookmark < ApplicationRecord
  belongs_to :user
  validates :url, presence: true
  validates :title, presence: true
  validates :user_id, presence: true
  validates :user_id, uniqueness: { scope: :url, message: "already bookmarked" }
  validates :source, presence: true
end
