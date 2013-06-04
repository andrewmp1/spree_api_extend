Spree::Api::ApiHelpers.class_eval do
  def user_attributes
    [:id, :email, :created_at, :updated_at, :spree_api_key]
  end

  def order_attributes
    [:id, :number, :item_total, :total, :state, :adjustment_total, :user_id, :created_at, :updated_at, :completed_at, :payment_total, :shipment_state, :payment_state, :email, :special_instructions, :token]
  end
end