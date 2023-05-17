# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.references :category, null: false, foreign_key: true
      t.references :subcategory, null: false, foreign_key: true
      t.string :name
      t.string :details
      t.string :image
      t.integer :mrp
      t.string :discount_type
      t.integer :discount
      t.integer :selling_price
      t.timestamps
    end
  end
end
