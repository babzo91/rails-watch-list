class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def new
    @list = List.new
    @movies = Movie.all
  end

  def create
    @list = List.new(list_params)

    if @list.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @list = List.find(params[:id])
    @movies = @list.movies
  end

  private

  def list_params
    params.require(:list).permit(:name, movie_ids: [])
  end
end
