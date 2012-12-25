class ListsController < ApplicationController

  def index
    @lists = List.all
    @list = List.new
  end

  def create
    @list = List.new(params[:list])
    if @list.save
      redirect_to list_path(@list)
    else 
      flash[:error] = "failed to create list"
      redirect_to root_path
    end
  end

  def new
    @list = List.new
  end

  def show
    @list = List.find(params[:id])
  end

  def destroy
    @list = List.find(params[:id])
    if @list.destroy
      flash[:notice] = "list deleted"
      redirect_to root_path
    else 
      flash[:error] = "failed to delete list"
      redirect_to root_path
    end
  end

end
