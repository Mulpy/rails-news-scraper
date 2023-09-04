class NewsArticle < ApplicationRecord
  validates :source, presence: true
end
