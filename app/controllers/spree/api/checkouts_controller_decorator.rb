Spree::Api::CheckoutsController.class_eval do
  def update
    user_id = object_params.delete(:user_id)
    if @order.update_attributes(object_params)

      if current_api_user.has_spree_role?("admin") && user_id.present?
        @order.associate_user!(Spree.user_class.find(user_id))
      end
      return if after_update_attributes
      state_callback(:after) if @order.next
      respond_with(@order, :default_template => 'spree/api/orders/show')
    else
      invalid_resource!(@order)
    end
  end
end