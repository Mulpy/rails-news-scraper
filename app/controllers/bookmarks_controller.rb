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
    @user_articles = UserNewsArticle.where(user_id: current_user.id)
    @user_article = UserNewsArticle.find(params[:user_article])
    @bookmark = Bookmark.new
    authorize @bookmark
  end

  def create
    @user_articles = UserNewsArticle.where(user_id: current_user.id)
    @user_article = UserNewsArticle.find(params[:user_article])
    @bookmark = Bookmark.new(bookmark_params)
    authorize @bookmark
    @bookmark.user = current_user
    @bookmark.url = @user_article.link
    @bookmark.title = @user_article.title
    @bookmark.content = @user_article.content
    @bookmark.source = @user_article.source
    @bookmark.image = @user_article.image
    @bookmark.published = @user_article.published
    if @bookmark.save
      redirect_to user_news_articles_path, status: :see_other
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
    params.permit(:url, :title, :content, :source, :image, :published, :user_id, :rating, :reader_comment)
  end
end
