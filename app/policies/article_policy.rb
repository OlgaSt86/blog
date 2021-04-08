# frozen_string_literal: true

class ArticlePolicy
  attr_reader :user, :article, :comment

  def initialize(user, article, comment)
    @user = user
    @article = article
    @comment = comment
  end

  def new?
    user.super_admin?
    user.admin?
  end

  def create?
    user.super_admin?
    user.admin?
  end

  def edit?
    user.super_admin?
    user.admin?
  end

  def update?
    user.super_admin?
    user.admin?
  end

  def destroy?
    user.super_admin?
    user.admin?
  end

end
