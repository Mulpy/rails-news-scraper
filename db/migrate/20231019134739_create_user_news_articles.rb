class CreateUserNewsArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :user_news_articles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.string :content
      t.string :source
      t.string :image
      t.string :link
      t.string :published

      t.timestamps
    end
  end
end
