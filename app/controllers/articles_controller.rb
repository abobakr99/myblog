class ArticlesController < ApplicationController
  # before_action :find_article , only:[:edit,:update,:destroy]
  def new
    @article = Article.new
  end

  def show
  end

  def create
    @article = Article.new(article_params)
      if @article.save
        flash[:success] ="Article was created successfully!"
        redirect_to root_path
      else
        render 'new'
      end
  end

  def edit 
  end

  def update
  end 

  private
  
  def article_params
    params.require(:article).permit(:title, :text)
  end
end
