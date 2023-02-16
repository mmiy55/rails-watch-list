class BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.all
  end

  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
  end

  def create
    @bookmark = Bookmark.new(list_params)
    @bookmark.list = List.find(params[:list_id])
    if @bookmark.valid?
      @bookmark.save
      redirect_to list_path(@bookmark.list)
    else
      render :new, status: :unprocessable_entity
    end
  end


  def list_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end

end
