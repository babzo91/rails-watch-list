class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def new
    @list = List.new
    @movies = Movie.all
  end

  def create
    raise
  end

  def show
  end
end
