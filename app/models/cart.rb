# frozen_string_literal: true

class Cart < ApplicationRecord
  belongs_to :user
  belongs_to :product
  
  def sub_total
      quantity * product.selling_price
  end

  def place_order
    order = user.orders.create(sub_total: sub_total)
    order.update(status: "pending")
    order.update(payment_type: "pending")
    order.update(payment_id: "pending")
      
    # product.each do |product|
    #   quantity = quantity_of(product)
    #   selling_price = product.selling_price
    #   total_price = selling_price * quantity

      # order.orderproducts.create(
      #   product: product,
      #   quantity: quantity,
      #   selling_price: selling_price,
      #   total_price: total_price
      # )
    # end
    order
  end

  def quantity_of(product)
    products.where(id: product.id).count
  end

end
