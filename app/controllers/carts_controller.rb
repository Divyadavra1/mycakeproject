# frozen_string_literal: true

class CartsController < ApplicationController
  before_action :authenticate_user!

  def index
    @carts = Cart.all
    @products = Product.new
    @pagy, @products = pagy(Product.all)
    # @carts = current_user.cart
  end

  def create
    @carts = Cart.new(cart_params)
    @products = Product.find_by(id: params[:id])
    @carts.user_id = current_user.id
    @carts.save
    redirect_to carts_path
  end

  # Update the quantity of a cart item
  def update
    @carts = current_user.carts.find_by(id: params[:id])
    @carts.update(quantity: params[:quantity].to_i)
    redirect_to carts_path
  end

  # def update
  #   @carts = Cart.all
  #   @carts = Cart.find_by(id: params[:id])
  #   @carts.update(cart_params)
  #   @carts.update_price
  #   redirect_to carts_path(@carts.id), notice: 'Quantity updated successfully.'
  # end

  # def update
  #   @cart = Cart.find(params[:id])
  #   @cart.update(cart_params)
  #     redirect_to carts_path
  # end

  def destroy
    @cart = Cart.find(params[:id])
    @cart.destroy
    redirect_to carts_path
  end

  private

  def cart_params
    params.require(:cart).permit(:user_id, :product_id, :quantity)
  end
end
