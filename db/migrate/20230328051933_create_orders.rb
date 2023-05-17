# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :sub_total
      t.string :payment_type
      t.integer :payment_id
      t.string :status

      t.timestamps
    end
  end
end
