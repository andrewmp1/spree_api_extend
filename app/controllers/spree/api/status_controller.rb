# Picked up this lil trick from EJS Demo App.
# Probably a better long term solution.
module Spree
  module Api
    class StatusController < Spree::Api::BaseController
      include Spree::Core::ControllerHelpers::Auth
      include Spree::Core::ControllerHelpers::Order
      
      def show
        @order = current_order
        @user = try_spree_current_user
      end
    end
  end
end