# frozen_string_literal: true

class OrdersController < ApplicationController
    # Example code for placing an order in a controller action
def place_order
    @cart = current_user.cart # Assuming you have authentication and the current_user method
    if @cart.products.empty?
      redirect_to carts_path, alert: "Cannot place an empty order."
    else
      @order = @cart.place_order
      @cart.destroy
      redirect_to order_path(@order), notice: "Order placed successfully."
    end
  end
end
