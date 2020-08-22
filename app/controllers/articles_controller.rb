class ArticlesController < ApplicationController
  before_action :find_article , only: [:edit,:update,:show,:destroy ]
  before_action :authenticate_user! , except: [:index, :show]

  def index
    @articles= Article.all.order("created_at DESC")
  end

  def show
    @comment = Comment.new
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

  private
  def find_article
    @article = Article.find(params[:id])
  end
  
  def article_params
    params.require(:article).permit(:title, :text)
  end
  
end
