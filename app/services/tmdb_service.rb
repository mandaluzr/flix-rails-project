# app/services/tmdb_service.rb
require 'faraday'
require 'json'

class TmdbService
  TMDB_API_BASE_URL = 'https://api.themoviedb.org/3'.freeze

  def initialize
    @conn = Faraday.new(url: TMDB_API_BASE_URL) do |faraday|
      faraday.request :url_encoded
      faraday.adapter Faraday.default_adapter
    end
  end

  def search_movies(query)
    response = @conn.get('search/movie') do |req|
      req.params['query'] = query
      req.params['api_key'] = ENV['TMDB_API_KEY']
    end
    JSON.parse(response.body)['results']
  rescue Faraday::Error => e
    Rails.logger.error "Error al conectar con TMDb: #{e.message}"
    []
  end
end
