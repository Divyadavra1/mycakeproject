# frozen_string_literal: true

class CheckoutController < ApplicationController
    def index
        @carts = current_user.carts.all
    end

    def place_order
        @carts = current_user.cart # Assuming you have authentication and the current_user method
      
        if @carts.products.empty?
          redirect_to carts_path, alert: "Cannot place an empty order."
        else
          @order = @carts.place_order
          @carts.destroy
          redirect_to order_path(@order), notice: "Order placed successfully."
        end
      end
end
