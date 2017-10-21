Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "trees#index"
    resources :trees,except:[:destroy] do
      post :create_child
    end

    namespace :api, defaults: { format: :json } do
      match 'trees' => 'trees#index',via: :get
      match 'trees' => 'trees#update', via: :patch
  end
end
