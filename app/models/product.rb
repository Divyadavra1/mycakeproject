# frozen_string_literal: true

class Product < ApplicationRecord
  # scope :filter_by_name, -> (name) { where name: name }
  # def self.search(search)
  #   where("product_id LIKE ?","%#{search}")
  # end
  belongs_to :category
  belongs_to :subcategory
  has_many :carts
  has_many :orderproducts
  has_many :users, through: :orderproducts
  has_one_attached :image, dependent: :destroy
end
