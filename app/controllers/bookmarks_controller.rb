class BookmarksController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user_bookmarks , only: [:destroy]
  before_action :bookmarked_articles , only: [:index]
  
  def index
  end

  def create
    @article = Article.find(params[:article_id])
    @bookmark = Bookmark.create(user_id: current_user.id , article_id: @article.id)
    if @bookmark.save 
      redirect_to article_path(@article)
    else
      redirect_to root_path
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @bookmark = Bookmark.find_by(user_id: current_user.id,article_id: @article.id)
    @bookmark.destroy
    redirect_to article_path(@article)
  end

  private
  def bookmark_params 
    params.require(:bookmark).permit(:user_id, :article_id)
  end

  def find_user_bookmarks
    @bookmarks = current_user.bookmarks.order("created_at DESC")
  end
  
  def bookmarked_articles
    @bookmarks = current_user.bookmarks.order("created_at DESC")
    @articles = []
    @bookmarks.each do |bookmark| 
      @articles.append(bookmark.article)
    end
  end
end