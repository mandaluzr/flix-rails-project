# app/controllers/tmdb_controller.rb
class TmdbController < ApplicationController
    def search
        # Verifica si hay un parámetro de búsqueda `query`, sino, muestra un mensaje vacío
        if params[:query].present?
          @tmdb_movies = TmdbService.new.search_movies(params[:query])
        else
          @tmdb_movies = []
        end
      end
  end
  