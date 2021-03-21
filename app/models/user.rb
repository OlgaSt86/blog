class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :confirmable ,:validatable

  include Likeable::UserMethods

  enum roles: { super_admin: 0, admin: 1, user: 2 }
end
