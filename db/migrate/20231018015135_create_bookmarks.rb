class CreateBookmarks < ActiveRecord::Migration[7.0]
  def change
    create_table :bookmarks do |t|
      t.references :user, null: false, foreign_key: true
      t.string :url
      t.string :title
      t.text :content
      t.string :source
      t.string :image
      t.string :published

      t.timestamps
    end
  end
end
