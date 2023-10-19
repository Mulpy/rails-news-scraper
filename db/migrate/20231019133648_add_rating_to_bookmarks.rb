class AddRatingToBookmarks < ActiveRecord::Migration[7.0]
  def change
    add_column :bookmarks, :rating, :integer
    add_column :bookmarks, :reader_comment, :text
  end
end
