object @user

attributes *user_attributes

child @order => :current_order do
  attribute :token
  extends "spree/api/orders/show"
end