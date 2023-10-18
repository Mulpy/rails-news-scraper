class BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.where(user_id: current_user.id)
  end

  def show
    @bookmark = Bookmark.find(params[:id])
  end

  def new
    @article = NewsArticle.find(params[:news_article_id])
    @bookmark = Bookmark.new
  end

  def create
    @article = NewsArticle.find(params[:news_article_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.user = current_user
    @bookmark.url = @article.link
    @bookmark.title = @article.title
    @bookmark.content = @article.content
    @bookmark.source = @article.source
    @bookmark.image = @article.image
    @bookmark.published = @article.published
    if @bookmark.save
      redirect_to bookmarks_path(@bookmark)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to bookmarks_path
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:url, :title, :content, :source, :image, :published)
  end
end
