Rails.application.routes.draw do
  get 'sessions/new'

  root 'home#index'

  get  'signup' => 'users#new'
  post 'signup' => 'users#create'

  get  'login'  => 'users#login'
  post 'login'  => 'users#login_attempt'

  get  'logout' => 'users#logout'

  patch 'create_or_update' => 'journals#create_or_update'
  post  'create_or_update' => 'journals#create_or_update'

  get   'update_date' => 'home#update_date'

  get	'update_calendar_month' => 'home#update_calendar_month'

  get   'home_create_note' => 'home#create_note'

  post	'create_note' => 'notes#create'

end
