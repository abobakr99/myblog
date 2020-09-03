class ArticlesController < ApplicationController
  before_action :find_article , only: [:edit,:update,:show,:destroy ,:is_bookmarked]
  before_action :authenticate_user! , except: [:index, :show]
  helper_method :bookmarked

  def index
    @articles= Article.all.order("created_at DESC")
  end

  def show
    @comment = Comment.new
    @bookmark = Bookmark.new
  end
  
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
      if @article.save
        flash[:success] ="Article was created successfully!"
        redirect_to @article
      else
        render 'new'
      end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      flash[:success] = "Article was updated successfuly "
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end 

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  def bookmarked
    @bookmarks = current_user.bookmarks.order("created_at DESC")
    articles = []
    @bookmarks.each do |bookmark| 
      articles.append(bookmark.article)
    end 
    return true if articles.include?(@article)
  end

  private
  def find_article
    @article = Article.find(params[:id])
  end
  
  def article_params
    params.require(:article).permit(:title,:content)
  end
end
