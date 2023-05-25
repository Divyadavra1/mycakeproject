# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :category
  belongs_to :subcategory
  has_many :carts
  has_many :orderproducts
  has_many :users, through: :orderproducts
  has_one_attached :image, dependent: :destroy
  # def update_price(quantity)
  #   self.price = original_price * quantity
  #   save
  # end
end
