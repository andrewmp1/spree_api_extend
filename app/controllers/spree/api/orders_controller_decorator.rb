Spree::Api::OrdersController.class_eval do
  def index
    if current_api_user.has_spree_role?("admin")
        @orders = Spree::Order.ransack(params[:q]).result.page(params[:page]).per(params[:per_page])
        respond_with(@orders)
    else
        @orders = Spree::Order.complete.where(user_id: current_api_user.id).ransack(params[:q]).result.page(params[:page]).per(params[:per_page])
        respond_with(@orders)
    end
  end

  def update
    @order = Spree::Order.find_by_number!(params[:id])
    authorize! :update, @order
    # Parsing line items through as an update_attributes call in the API will result in
    # many line items for the same variant_id being created. We must be smarter about this,
    # hence the use of the update_line_items method, defined within order_decorator.rb.
    order_params = nested_params
    line_items = order_params.delete("line_items_attributes")

    if @order.update_attributes(order_params)
      @order.update_line_items(line_items)
      @order.update!
      respond_with(@order, :default_template => :show)
    else
      invalid_resource!(@order)
    end
  end
end