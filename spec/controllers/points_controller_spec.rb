require 'spec_helper'

describe PointsController do

 describe "UPDATE /lists/:id/points/:id" do
    before do 
      @listC = List.create :name => "Test List PC"
      @pointC = Point.create :list_id => @listC.id, :content => "test content", :pro => true
      @attr = { :content => "Test Point Controller Changed", :weight => "3" }
    end
    it "should update point content" do
      put :update, :id => @pointC.id, :list_id => @listC.id, :point => @attr
      @pointC.reload
      (@pointC.content).should == "Test Point Controller Changed"
      (@pointC.weight).should == 3
    end
  end

end
