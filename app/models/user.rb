# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :confirmable, :validatable
  acts_as_voter
  enum roles: { super_admin: 0, admin: 1, user: 2 }


  def current_super_admin
    current_user.is_super_admin
  end
end
