# frozen_string_literal: true

class RemoveUserFromOrderproducts < ActiveRecord::Migration[7.0]
  def change
    remove_reference :orderproducts, :user, null: false, foreign_key: true
  end
end
