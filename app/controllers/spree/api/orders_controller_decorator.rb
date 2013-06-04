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
end