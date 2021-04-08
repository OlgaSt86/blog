class CommentPolicy < CommentsController
  attr_reader :user, :comment

  def initialize(user, comment)
    @user = user
    @comment = comment
  end

  def destroy?
    user.super_admin?
    user.admin?
  end

  def create?
    user.super_admin?
    user.admin?
  end

end
