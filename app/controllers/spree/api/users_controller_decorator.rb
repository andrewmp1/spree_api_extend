# Override create to allow anyone to create
# This No Bueno ?
Spree::Api::UsersController.class_eval do
  def create
    @user = Spree.user_class.new(params[:user])
    if @user.generate_spree_api_key!
      # # Create session for user?
      # sign_in(@user, bypass: true)
      # session[:spree_user_signup] = true
      # associate_user
      respond_with(@user, :status => 201, :default_template => :show)
    else
      invalid_resource!(@user)
    end
  end
end