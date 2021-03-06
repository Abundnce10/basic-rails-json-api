BasicRailsJsonApi::Application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :users, only: [:create, :index, :show]
      resources :sessions, only: :create
    end
  end
end
