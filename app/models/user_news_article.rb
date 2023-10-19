class UserNewsArticle < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :link, presence: true
  validates :user_id, presence: true
  validates :source, presence: true
end
