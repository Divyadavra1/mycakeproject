# frozen_string_literal: true

ActiveAdmin.register Product do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :category_id, :subcategory_id, :name, :details, :mrp, :discount_type, :discount, :selling_price, :image
  show do
    attributes_table do
      row :name
      row :details
      row :mrp
      row :discount_type
      row :discount
      row :selling_price
      row :image do
        image_tag url_for(product.image) if product.image.attached?
      end
    end
  end
  form do |f|
    f.inputs 'Product Details' do
      f.input :category_id, as: :select, collection: Category.all.collect { |category|
                                                       [category.name, category.id]
                                                     }
      f.input :subcategory_id, as: :select, collection: Subcategory.all.collect { |subcategory|
                                                          [subcategory.name, subcategory.id]
                                                        }
      f.input :name
      f.input :details
      f.input :mrp
      f.input :discount_type
      f.input :discount
      f.input :selling_price
      f.input :image, as: :file
    end
    f.actions
  end

  #
  # or
  #
  # permit_params do
  #   permitted = [:category_id, :subcategory_id, :name, :details, :image, :mrp, :discount_type, :discount, :selling_price]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
