# frozen_string_literal: true

class CreateOrderproducts < ActiveRecord::Migration[7.0]
  def change
    create_table :orderproducts do |t|
      t.references :user, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.integer :quantity
      t.integer :mrp
      t.integer :discount_type
      t.integer :discount
      t.integer :selling_price
      t.integer :total_price

      t.timestamps
    end
  end
end
