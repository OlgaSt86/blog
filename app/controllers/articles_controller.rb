# frozen_string_literal: true

class ArticlesController < ApplicationController
 before_action :authenticate_user!, except: [:index, :show]
 before_action :set_article, only: [:show, :edit, :destroy, :update]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    authorize @article

    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    authorize @article

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path
  end

 def set_article
   @article = Article.find(params[:id])
 end

  private

  def article_params
    params.require(:article).permit(:title, :body, :status)
  end
end