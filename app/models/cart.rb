# frozen_string_literal: true

class Cart < ApplicationRecord
  belongs_to :user
  belongs_to :product
  def update_price
    self.selling_price = quantity * product.selling_price
    save
  end
end
