Reminder::Application.routes.draw do
 
  resources :reminder_messages

  resources :reminder_task_lists

  resources :reminder_tasks

  resources :reminder_schedules

  resources :reminders_mains

  root :to => "reminders_mains#index"

  
  get "get_reminders" => "reminders_mains#get_reminders", :as => "get_reminders"

end
