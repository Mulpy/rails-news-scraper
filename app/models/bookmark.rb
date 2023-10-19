class Bookmark < ApplicationRecord
  belongs_to :user
  validates :url, presence: true
  validates :title, presence: true
  validates :user_id, presence: true
  validates :url, uniqueness: { scope: :user_id, message: "already bookmarked" }
  validates :title, uniqueness: { scope: :user_id, message: "already bookmarked" }
  validates :source, presence: true
end
