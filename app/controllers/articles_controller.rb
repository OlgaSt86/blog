# frozen_string_literal: true

class ArticlesController < ApplicationController
  respond_to :js, :html, :json
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_article, only: %i[show edit destroy update]
  # before_action :authenticate_user!, only: [:like]

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
    # authorize @article

    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
    authorize @article
  end

  def update
    @article = Article.find(params[:id])
    authorize @article

    if @article.update(article_params)
      redirect_to @article, success: 'Статья успешно обновлена'
    else
      render :edit, danger: 'Статья не обновлена'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path
  end

  def like
    @article = Article.find(params[:id])
    if params[:format] == 'like'
      @article.liked_by current_user
    elsif params[:format] == 'unlike'
      @article.unliked_by current_user
    end
  end

  def set_article
    @article = Article.find(params[:id])
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :status)
  end
end
