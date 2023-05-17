# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :authenticate_user!, except: %i[index about checkout shopdetails contact]

  def index
    @pagy, @products = pagy(Product.all)
    @product = Product.all
  end

  def about; end

  def products
    @pagy, @product = pagy(Product.all)
    @products = Product.all
  end

  def checkout; end

  def signin; end

  def signup; end

  def forgotpassword; end
end
