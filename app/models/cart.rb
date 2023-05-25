# frozen_string_literal: true

class Cart < ApplicationRecord
  belongs_to :user
  belongs_to :product
  
  def sub_total
      quantity * product.selling_price
  end
end
