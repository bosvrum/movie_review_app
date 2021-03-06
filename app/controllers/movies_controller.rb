class MoviesController < ApplicationController
  before_action :require_signin, except: [:index, :show]
  before_action :require_admin, except: [:index, :show]

  def index
    @movies = Movie.released
  end

  def show
    @movie = Movie.find(params[:id])
    @review = Review.new
    @review.movie = @movie
    @fans = @movie.fans
    if current_user
      @current_favorite = current_user.favorites.find_by(movie_id: @movie.id)
    end
    @genres = @movie.genres
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      flash[:notice] = "Movie successfully updated!"
      redirect_to @movie
    else
      render :edit
    end
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to @movie, notice: "Movie successfully created!"
    else
      render :new
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.delete
    redirect_to movies_url, alert: "Movie successfully deleted!"
    #redirect_to movies_url, danger: "I'm sorry, Catalin, I'm afraid I can't do that!"
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :description, :rating, :released_on, :total_gross, :cast, :director, :duration, :image_file_name, genre_ids: [])
  end
end