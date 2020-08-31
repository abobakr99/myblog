class CommentsController < ApplicationController 
  before_action :authenticate_user!  #, except: [:index, :show]

  def new 
    @comment = Comment.new
  end

  def create 
    @article = Article.find(params[:article_id])
    @comment = Comment.create(comment_params)
    @comment.user = current_user
    @comment.article = @article
    #puts "====== save : #{} ======= "
     
    if @comment.save!
      redirect_to article_path(@article)
    else
      redirect_to new_user_session_path
    end
  end 
  
  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end