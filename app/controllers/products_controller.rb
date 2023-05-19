# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    # @products = Product.all
    @pagy, @products = pagy(Product.all, items: 8)

  end

  def sort
    @sort_order = params[:sort_order]
    @products = Product.order(name: @sort_order)
  end

  def filter
    @filter_name = params[:filter_name]
    @products = Product.where('name LIKE ?', "%#{@filter_name}%")
  end

  def search
    if params[:search].blank?
      redirect_to products_path and return
    else
      @product = params[:search].downcase
      @results = Product.all.where('lower(name) LIKE :search', search: "%#{@product}%")
    end
  end

  def product_params
    params.require(:product).permit(:name, :selling_price, :product_id)
  end
end
