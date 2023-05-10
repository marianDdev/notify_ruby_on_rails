Rails.application.routes.draw do
  mount Avo::Engine, at: Avo.configuration.root_path
  resources :pages
  resources :users
  resources :mail_templates
  resources :notifications
  
  resources :companies do
    collection do
      post :import
    end
  end
  
  root "pages#home"
end
