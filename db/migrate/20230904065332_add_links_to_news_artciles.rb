class AddLinksToNewsArtciles < ActiveRecord::Migration[7.0]
  def change
    add_column :news_articles, :link, :string
    add_column :news_articles, :published, :string
  end
end
