child @order do
  attribute :token
  extends "spree/api/orders/show"
end

node :user do
  attributes :id => @user
end