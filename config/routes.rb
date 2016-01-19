Rails.application.routes.draw do
  get 'task/index'

  get 'task/show'

  get 'task/new'

  get 'task/create'

  get 'task/edit'

  get 'task/update'

  get 'task/destroy'

  resources :projects

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

  get 'pages/index'
  root 'pages#index'
end
