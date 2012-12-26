class PointsController < ApplicationController

  before_filter :find_list

  def create
    @point = @list.points.new(params[:point])
    respond_to do |format|
      if @point.save
        format.html { redirect_to list_url(@list) }
        format.js
      else 
        flash[:notice] = "Failed"
        format.html { redirect_to list_url(@list) }
        format.js
      end
    end
  end

  def show
  end

  def update
  end

  def destroy
    @point = @list.points.find(params[:id])
    @point.destroy
    redirect_to list_url(@list) 
  end

  private

  def find_list
    @list = List.find(params[:list_id])
  end

end
