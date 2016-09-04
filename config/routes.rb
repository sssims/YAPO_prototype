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
  get   'update_task_date' => 'home#update_task_date'

  get	'update_calendar_month' => 'home#update_calendar_month'

  get   'home_create_note' => 'home#create_note'
  get   'home_create_longterm_note' => 'home#create_longterm_note'

  post	'create_note' => 'notes#create'
  post	'create_longterm_note' => 'notes#create_longterm'
  post	'create_note' => 'notes#create'

  get   'home_create_task' => 'home#create_task'
  post	'create_task' => 'tasks#create'

  get   'tasks_index' => 'tasks#index'
  get   'notes_index' => 'notes#index'

  post	'tasks_mark_complete' => 'tasks#mark_complete'

  get	'update_left_nav' => 'home#update_left_nav'
  get	'update_right_nav' => 'home#update_right_nav'

  get	'notes_longterm_index' => 'notes#longterm_index'

  resource :journals
  resource :notes

  get	'notes_complete' => 'notes#complete'

  get	'journals_notebook' => 'journals#notebook'
  get	'notes_notebook' => 'notes#notebook'
  get	'notes_notebook_show' => 'notes#notebook_show'
 
  get	'notes_notebook_new' => 'notes#notebook_new'

  get 'notes_notebook_update' => 'notes#notebook_update'
  patch 'notes_notebook_update' => 'notes#notebook_update'
  post 'notes_notebook_update' => 'notes#notebook_update'

  delete 'notes_notebook_destroy' => 'notes#notebook_destroy'

end
