Spree::Api::ApiHelpers.class_eval do
  def user_attributes
    [:id, :email, :created_at, :updated_at, :spree_api_key]
  end
end