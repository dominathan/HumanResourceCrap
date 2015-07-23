Rails.application.routes.draw do
  resources :users
  root "users#index"

  get 'users_paginated_ajax/:page_number',
        to: 'users#users_paginated_ajax',
        as: 'user_per_page_ajax'

end
