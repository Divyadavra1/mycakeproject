# frozen_string_literal: true

class ChangeImageToBeStringInProducts < ActiveRecord::Migration[7.0]
  def change
    change_column :products, :image, :string
  end
end
