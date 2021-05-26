# frozen_string_literal: true

class User < ApplicationRecord
  acts_as_voter
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :confirmable, :validatable



  enum roles: { super_admin: 0, admin: 1, user: 2 }
end
