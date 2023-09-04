class CreateNewsArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :news_articles do |t|
      t.string :title
      t.text :content
      t.string :source
      t.string :image

      t.timestamps
    end
  end
end
