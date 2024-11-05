class MoviesController < ApplicationController
  def index
    @movies = Movie.released
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    save_movie(@movie, :edit)
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    save_movie(@movie, :new)
   end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_url, status: :see_other
  end

  private

  def save_movie(movie, action)
    if movie.save
      redirect_to movie, notice: "Movie successfully #{action}!"
    else
      render action, status: :unprocessable_entity
    end
  end

  def movie_params
    params.require(:movie).permit(:title, :rating, :total_gross, :description, :released_on, :image_file_name, :duration, :director)
  end

end
