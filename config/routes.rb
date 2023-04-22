Rails.application.routes.draw do
  resources :manufacturers
  resources :mail_templates
  resources :notifications
  
  root "mail_templates#index"
end
