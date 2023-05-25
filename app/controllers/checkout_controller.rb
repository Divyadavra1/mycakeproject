# frozen_string_literal: true

class CheckoutController < ApplicationController
    def index
        @carts = current_user.carts.all
      end
end
