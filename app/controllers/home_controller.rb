# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :authenticate_user!, except: %i[index about checkout shopdetails contact]

  def index
    @pagy, @products = pagy(Product.all, items: 8)
  end
  
  def shopdetails; end

  def contact; end

  def about; end

  def checkout; end

  def signin; end

  def signup; end

  def forgotpassword; end
end
