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
    if @movie.update(movie_params)
      redirect_to @movie, notice: "Movie successfully updated!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.create(movie_params)
      redirect_to @movie, notice: "Movie successfully created!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    if @movie.destroy
      redirect_to movies_url, notice: "Movie successfully deleted!"
    else
    redirect_to movies_url, status: :see_other
    end
  end

  private

  # def save_movie(movie, action)
  #   if movie.save
  #     redirect_to movie, notice: "Movie successfully #{action}!"
  #   else
  #     render action, status: :unprocessable_entity
  #   end
  # end

  def movie_params
    params.require(:movie).permit(:title, :rating, :total_gross, :description, :released_on, :image_file_name, :duration, :director)
  end

end