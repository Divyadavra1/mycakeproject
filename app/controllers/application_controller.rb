# frozen_string_literal: true
class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :initialize_session
  # before_action :load_cart
  before_action :set_render_cart
  before_action :initialize_cart
  include Pagy::Backend

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name address phone zip])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name address phone zip])
  end

  include ApplicationHelper
  # def initialize_session
  #   session[:cart] ||= []
  # end

  # def load_cart
  #    @cart = Product.find(session[:cart])
  # end

  def set_render_cart
    @render_cart = true
  end

  def initialize_cart
    # @cart ||= Cart.find_by(id: session[:cart_id])
    # if @cart.nil?
    #   @cart = Cart.create
    # session[:cart_id] = @cart.id
    # end
  end
end
