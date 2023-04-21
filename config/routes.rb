Rails.application.routes.draw do
  resources :mail_templates
  resources :notifications
  
  root "mail_templates#index"
end
