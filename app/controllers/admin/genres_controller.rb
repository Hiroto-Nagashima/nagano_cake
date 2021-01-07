class Admin::GenresController < ApplicationController
  def index
    @genre=Genre.new
    @genres=Genre.all
  end

  def create
   @genre=Genre.new(genre_params)
   if @genre.save
     redirect_to admin_genres_index_path
   else
     render "index"
   end

  end

  def update
    @genre=genre.find(params[:id])
    if @genre.update(params[:id])
      redirect_to admin_genres_index_path
    else
    render "edit"
    end
  end

  def edit
    @genre=Genre.find(params[:id])
  end

private
  def genre_params
   params.require(:genre).permit(:name)
  end
end



