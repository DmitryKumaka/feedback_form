Rails.application.routes.draw do
  root 'forms#new'
  resources :forms
end
