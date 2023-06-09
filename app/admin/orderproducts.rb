# frozen_string_literal: true

ActiveAdmin.register Orderproduct do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :user_id, :product_id, :quantity, :mrp, :discount_type, :discount, :selling_price, :total_price
  #
  # or
  #
  # permit_params do
  #   permitted = [:user_id, :product_id, :quantity, :mrp, :discount_type, :discount, :selling_price, :total_price]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
