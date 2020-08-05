class ArticlesController < ApplicationController
  before_action :find_article , only: [:edit,:update,:show ]
  def index
    @articles= Article.all
  end

  def show
  end
  
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
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
      redirect_to edit_article_path(@article)
    end
  end 

  private
  def find_article
    @article = Article.find(params[:id])
  end
  
  def article_params
    params.require(:article).permit(:title, :text)
  end
end
