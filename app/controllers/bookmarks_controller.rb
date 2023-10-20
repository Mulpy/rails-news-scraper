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
    @bookmark = Bookmark.new(create_params)
    authorize @bookmark
    @bookmark.user = current_user
    @bookmark.url = @user_article.link
    @bookmark.title = @user_article.title
    @bookmark.content = @user_article.content
    @bookmark.source = @user_article.source
    @bookmark.image = @user_article.image
    @bookmark.published = @user_article.published
    if bookmarked?
      flash[:notice] = 'This article is already bookmarked.'
      redirect_to user_news_articles_path, status: :see_other
    elsif @bookmark.save
      redirect_to user_news_articles_path, status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark
  end

  def update
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark
    if @bookmark.update(update_params)
      redirect_to bookmarks_path, status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    bookmark = Bookmark.find(params[:id])
    authorize bookmark
    bookmark.destroy
    redirect_to bookmarks_path, status: :see_other
  end

  def bookmarked?
    @user_article = UserNewsArticle.find(params[:user_article])
    @bookmarks = Bookmark.where(user_id: current_user.id)
    @bookmarks.any? { |bookmark| bookmark.url == @user_article.link }
  end

  private

  def create_params
    params.permit(:url, :title, :content, :source, :image, :published, :user_id)
  end

  def update_params
    params.require(:bookmark).permit(:rating, :reader_comment)
  end
end
