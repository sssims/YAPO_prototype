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

  get   'home_create_task' => 'home#create_task'
  post	'create_task' => 'tasks#create'

  get   'tasks_index' => 'tasks#index'
  get   'notes_index' => 'notes#index'

  post	'tasks_mark_complete' => 'tasks#mark_complete'

  resource :journals

end
