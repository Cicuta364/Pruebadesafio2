Rails.application.routes.draw do


  resources :projects do
    resources :tasks
  end

   devise_for :users, controllers: {
     sessions: 'users/sessions',
     registrations: 'users/registrations'
   }

   devise_scope :user do
     authenticated do
       root to: 'projects#index', as: 'authenticated_user_root'
     end

     unauthenticated do
       root to: 'pages#index', as: 'unauthenticated_user_root'
     end
   end

  root 'pages#index'
end
