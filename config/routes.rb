Rails.application.routes.draw do
  root 'flats#index'
  resources :flats, only: %i[index]
end
