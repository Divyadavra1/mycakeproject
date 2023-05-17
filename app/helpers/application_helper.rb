# frozen_string_literal: true

module ApplicationHelper
  include Pagy::Frontend

  def current_order
    if !session[:product_id].nil?
      Product.find(session[:product_id])
    else
      Product.new
    end
  end
end
