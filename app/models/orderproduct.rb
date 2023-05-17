# frozen_string_literal: true

class Orderproduct < ApplicationRecord
  belongs_to :user
  belongs_to :product
end
