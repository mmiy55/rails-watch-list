class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @bookmarks = @list.bookmarks
  end

  def new
    @list = List.new()
  end

  def create
    @list = List.new(list_params)
    if @list.valid?
      @list.save
    else
      render :new, status: :unprocessable_entity
    end
    raise
  end


  def list_params
    params.require(:list).permit(:name)
  end

end
