# frozen_string_literal: true

class AddRolesToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :roles, :integer, default: 2, null: false
  end
end
