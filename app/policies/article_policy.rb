# frozen_string_literal: true

class ArticlePolicy
  attr_reader :user, :article

  def initialize(user, article)
    @user = user
    @article = article
  end

  def update?
    user.super_admin?
  end

  def create?
    user.super_admin?
  end
end
