class MoviesController < ApplicationController
  def index
    # Ordenação baseada no sort
    sort = params[:sort] || 'id' # padrão: ordenar por ID
    
    case sort
    when 'title'
      @movies = Movie.order(title: :asc)
      @sort_column = 'title'
    when 'release_date'
      @movies = Movie.order(release_date: :asc)
      @sort_column = 'release_date'
    else
      @movies = Movie.all
      @sort_column = nil
    end
    
    # Destacar a coluna ordenada
    @sort_column = sort if ['title', 'release_date'].include?(sort)
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      flash[:notice] = "#{@movie.title} was successfully created."
      redirect_to movies_path
    else
      render :new
    end
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      flash[:notice] = "#{@movie.title} was successfully updated."
      redirect_to movie_path(@movie)
    else
      render :edit
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :rating, :description, :release_date)
  end
end