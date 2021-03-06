# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!, only: %i[show]
  # def create
  #   @article = Article.find(params[:article_id])
  #     @comment = @article.comments.create(comment_params)
  #     redirect_to article_path(@article)
  #   end
  def show
    @comment = @article.comments.find(params[:id])
  end

  def create
    @article = Article.find(params[:article_id])
    if current_user
      @comment = @article.comments.create(comment_params)
      redirect_to article_path(@article)
    else
      flash[:alert] = 'You are not authorized user!'
    end
  end

  def destroy
    @article = Article.find(params[:article_id])
    if current_user
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
    else
      flash[:alert] = 'You are not authorized user!'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body, :status)
  end
end


