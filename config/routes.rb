Spree::Core::Engine.routes.append do
  namespace :api, :defaults => { :format => 'json' } do
    resource :session, controller: :user_session
    resource :status, controller: :status
  end
end
