# frozen_string_literal: true

ActiveAdmin.register_page 'Dashboard' do
  menu priority: 1, label: proc { I18n.t('active_admin.dashboard') }

  content title: proc { I18n.t('active_admin.dashboard') } do
    div class: 'blank_slate_container', id: 'dashboard_default_message' do
      span class: 'blank_slate' do
        span I18n.t("active_admin.dashboard
  _welcome.welcome")
        small I18n.t('active_admin.dashboard_welcome.call_to_action')
      end
      columns do
        column do
          panel 'Recent Orders' do
            ul do
              Order.order(5).map do |order|
                li link_to(order.user_id, admin_order_path(order))
                li link_to(order.sub_total, admin_order_path(order))
              end
            end
          end
        end
        columns do
          column do
            panel 'Recent Product' do
              ul do
                Product.order(5).map do |product|
                  li link_to(product.name, admin_product_path(product))
                  li link_to(product.details, admin_product_path(product))
                end
              end
            end
          end
          columns do
            column do
              panel 'User Details' do
                ul do
                  User.order(5).map do |user|
                    li link_to(user.name, admin_user_path(user))
                    li link_to(user.email, admin_user_path(user))
                  end
                end
              end
            end
          end
        end
      end

      # Here is an example of a simple dashboard with columns and panels.
      #

      #   column do
      #     panel "Info" do
      #       para "Welcome to ActiveAdmin."
      #     end
      #   end
    end
  end
end
