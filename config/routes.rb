Rails.application.routes.draw do
  root 'home#top'
  get 'users/new'=>'users#new',as: 'users_new'
  post 'users/create'=>'users#create',as: 'users_create'
  get 'users/:user_id/edit'=>'users#edit',as: 'users_edit'
  patch 'users/:user_id/update'=>'users#update',as:  'users_update'
  get 'users/:user_id'=>'users#show',as: 'users_show'
  get 'sessions/new'=>'sessions#new',as: 'sessions_new'
  post 'sessions/create'=>'sessions#create',as: 'sessions_create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
