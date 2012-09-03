Reminder::Application.routes.draw do
 
  resources :reminder_messages

  resources :reminder_task_lists

  resources :reminder_tasks

  resources :reminder_schedules

  resources :reminders_mains

  root :to => "reminders_mains#index"

  
  get "get_reminders" => "reminders_mains#get_reminders", :as => "get_reminders"
  get "add_reminder" => "reminders_mains#add_reminder", :as => "add_reminder"
  get "delete_reminder" => "reminders_mains#delete_reminder", :as => "delete_reminder"
  post "send_apn" => "reminders_mains#send_apn", :as => "send_apn"
  get "new_apn" => "reminders_mains#new_apn", :as => "new_apn"

end
