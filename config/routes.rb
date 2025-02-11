# config/routes.rb
Rails.application.routes.draw do

    # Ruta raíz de la aplicación, apunta a MoviesController#index
    root "movies#index"
  
    # Rutas RESTful para el controlador Movies
    resources :movies do
      resources :reviews
    end

    # Rutas RESTful para el controlador Sessions
    resources :sessions, only: [:new, :create, :destroy]

    # Rutas RESTful para el controlador Users
    resources :users
    get "signup" => "users#new"
  
    # Rutas para el controlador Tmdb, con solo la acción de búsqueda
    resources :tmdb, only: [] do
      collection do
        get :search  # Esto generará la ruta /tmdb/search para realizar búsquedas
      end
    end
  end
  