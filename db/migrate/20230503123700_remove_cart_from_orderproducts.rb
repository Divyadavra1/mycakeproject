# frozen_string_literal: true

class RemoveCartFromOrderproducts < ActiveRecord::Migration[7.0]
  def change
    remove_reference :orderproducts, :cart, null: false, foreign_key: true
  end
end
