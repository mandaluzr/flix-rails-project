# config/routes.rb
Rails.application.routes.draw do
  resources :users
    # Ruta raíz de la aplicación, apunta a MoviesController#index
    root "movies#index"
  
    # Rutas RESTful para el controlador Movies
    resources :movies do
      resources :reviews
    end
  
    # Rutas para el controlador Tmdb, con solo la acción de búsqueda
    resources :tmdb, only: [] do
      collection do
        get :search  # Esto generará la ruta /tmdb/search para realizar búsquedas
      end
    end
    
  end
  