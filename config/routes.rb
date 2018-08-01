Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'application#index'

  post 'auth/login', to: 'tenants#login'

  namespace :api do
    namespace :v1 do
      get 'questions/list', to: 'questions#list'
    end
  end


end
