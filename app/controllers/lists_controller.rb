class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def new
    @list = List.new
    @movies = Movie.all
  end

  def create
    # @movies = Movie.where(id: params[:list][:movie_ids])
    list = List.new(params_list)

    if  list.save
      redirect_to lists_path
    else
      render :new, :unprocessable_entity
    end
  end
    # D11FR08

    def show
      @list = List.find(params[:id])
      @movies = @list.movies
    end

  private

  def params_list
    params.require(:list).permit(:name)
    # params.require(:list).permit(:movie_ids)
  end
end
