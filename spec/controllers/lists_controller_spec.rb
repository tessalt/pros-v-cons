require 'spec_helper'

describe ListsController do

  describe "UPDATE /lists/:id" do
    before do 
      @list = List.create :name => "Test List 3"
      @attr = { :name => "new name test", :id => @list.id }
    end
    it "should update list name" do
      put :update, :id => @list.id, :list => @attr
      @list.reload
      (@list.name).should == "new name test"
    end
  end

end
