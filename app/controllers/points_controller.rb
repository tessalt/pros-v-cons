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
    @point = @list.points.find(params[:id])
    respond_to do |format|
      if @point.update_attributes(params[:point])
        format.html { redirect_to(list_url(@list), :notice => 'User was successfully updated.') }
        format.json { respond_with_bip(@point)}
      else
        format.html { render :action => "edit" }
        format.json { respond_with_bip(@point) }
      end
    end
  end

  def destroy 
    @point = @list.points.find(params[:id])
    @point.destroy
    respond_to do |format|
      format.html { redirect_to list_url(@list) }
      format.js
    end
  end

  def sort
    params[:point].each_with_index do |id, index|
      Point.update_all({position: index+1}, {id:id})
    end
    render nothing: true
  end

  private

  def find_list
    @list = List.find(params[:list_id])
  end

end
