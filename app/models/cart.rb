# frozen_string_literal: true

class Cart < ApplicationRecord
  belongs_to :user
  belongs_to :product
  
   def total_price
    quantity * selling_price
  end
end
