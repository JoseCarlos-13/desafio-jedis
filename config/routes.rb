Rails.application.routes.draw do
  resources :municipies, only: %i[index show update create]
end
