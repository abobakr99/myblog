class UsersController < ApplicationController

  # finds articles that belongsto a specific user
  def show_user_articles
    @user = User.find(params[:user_id])
    @articles= @user.articles
    render 'articles/user_articles'
  end
end