module Spree
  module Api
    class UserSessionController < Spree::Api::BaseController
      include Spree::Core::ControllerHelpers::Auth
      include Spree::Core::ControllerHelpers::Order
      
      # expects json:
      # { session: {
      #      "email": "",
      #      "password": ""
      #   }
      # }
      # TODO. create/load session ?
      def create
        # if user.present?
        #   @order = current_order
        #   @user = user
        #   return respond_with(@user, :status => 200, :default_template => :show)
        # end

        user = Spree::User.find_for_database_authentication(:login => params[:session][:login])
        if user && user.valid_password?(params[:session][:password])
          # Cookie sessions are our friend... for now.
          # sign_in(user, :event => :authentication, :bypass => true)
          @order = current_order(true)
          @user = user
          return respond_with(@user, :status => 200, :default_template => :show)
        else
          render "spree/api/errors/not_found", :status => 404 and return
        end
      end

      def show
        # lookup user by token or session
        if user
          @order = current_order
          @user = user
          respond_with(@user, :status => 200, :default_template => :show)
        else
          render "spree/api/errors/not_found", :status => 404 and return
        end
      end

      def destroy
        # Do we really need to clear cookies & session?
        # Not all api clients will be browsers.
        cookies.clear
        session.clear
        super
      end

      private

      def user
        @current_api_user || try_spree_current_user
      end
    end
  end
end