class BookmarksController < ApplicationController
  def index
    @bookmarks = policy_scope(Bookmark).all
    @bookmarks = Bookmark.where(user_id: current_user.id)
  end

  def show
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark
  end

  def new
    @articles = NewsArticle.all
    @article = NewsArticle.find(params[:article])
    @bookmark = Bookmark.new
    authorize @bookmark
  end

  def create
    @articles = NewsArticle.all
    @article = NewsArticle.find(params[:article])
    @bookmark = Bookmark.new(bookmark_params)
    authorize @bookmark
    @bookmark.user = current_user
    @bookmark.url = @article.link
    @bookmark.title = @article.title
    @bookmark.content = @article.content
    @bookmark.source = @article.source
    @bookmark.image = @article.image
    @bookmark.published = @article.published
    if @bookmark.save
      redirect_to bookmarks_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    bookmark = Bookmark.find(params[:id])
    authorize bookmark
    bookmark.destroy
    redirect_to bookmarks_path, status: :see_other
  end

  private

  def bookmark_params
    params.permit(:url, :title, :content, :source, :image, :published)
  end
end
