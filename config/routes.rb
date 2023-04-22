Rails.application.routes.draw do
  resources :manufacturers do
    collection do
      post :import
    end
  end
  resources :mail_templates
  resources :notifications
  
  root "mail_templates#index"
end
