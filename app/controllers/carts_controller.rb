# frozen_string_literal: true

class CartsController < ApplicationController
  before_action :authenticate_user!

  def index
    @carts = current_user.carts.all
    @pagy, @products = pagy(Product.all)
  end

  def create
    @carts = Cart.new(cart_params)
    @products = Product.find_by(id: params[:id])
    @carts.user_id = current_user.id
    @carts.save
    redirect_to carts_path
  end

  def update
    @carts = current_user.carts.find_by(id: params[:id])
    if @carts.update(carts_params)
      total_price
      redirect_to carts_path(@carts), notice: 'Cart item updated successfully.'
    else
      render :show
    end
  end

  def destroy
      @cart = Cart.find(params[:id])
      @cart.destroy
      redirect_to carts_path
    end
  private

  def total_price
    quantity * selling_price
  end

  def carts_params
    params.require(:cart).permit(:quantity)
  end
    # def update
    #   @carts = current_user.carts
    #   @carts.update(carts_params)
    #   # @carts.calculate_total
    #   redirect_to carts_path, notice: 'Cart was successfully updated.'
    # end
    private
  
    # def carts_params
    #   params.require(:cart).permit(:quantity, :selling_price)
    # end
  
    # def update_product_prices
      # @cart.product.update(selling_price: @cart.product.selling_price * @cart.quantity)
    # end
   
  # def update
  #   @carts = Cart.find_by(id: params[:id])
  #   @carts = Cart.new(cart_params)
  #   redirect_to carts_path
  # end
  
  # def update
  #   @carts = Cart.all
  #   @carts = Cart.find_by(id: params[:id])
  #   @carts.update(cart_params)
  #   @carts.update_price
  #   redirect_to carts_path(@carts.id), notice: 'Quantity updated successfully.'
  # end



  private

  def cart_params
    params.require(:cart).permit(:product_id, :quantity)
  end
end
