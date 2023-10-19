class NewsArticle < ApplicationRecord
  validates :title, presence: true
  validates :link, presence: true
  validates :source, presence: true
end
