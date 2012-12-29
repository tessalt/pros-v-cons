require 'spec_helper'

describe "Lists" do
  subject { page }

  describe "GET /lists" do
    it "should display lists" do
      @list = List.create :name => "Test List 1"
      visit root_path
      page.should have_content('Test List 1')
    end
  end

  describe "POST /lists" do

    before { visit root_path }

    describe "with invalid information" do 
      it "should not create a new list" do
        expect { click_button "Create List" }.not_to change(List, :count)
      end
    end

    describe "with valid information" do
      before { fill_in 'list_name', with: "Test List Content"}
      it "should create a new list" do
        expect { click_button "Create List"}.to change(List, :count).by(1)
        page.should have_content("Test List Content")
      end
    end

  end

  describe "DELETE /lists/:id" do
    before do 
      @list = List.create :name => "Test List 2" 
      visit list_path(@list)
    end
    it "should delete list" do
      expect { click_link "delete" }.to change(List, :count).by(-1)
    end
  end

  describe "Points" do
    before do 
      @list = List.create :name => "Test List 3"
      @point = Point.create :list_id => @list.id, :content => "test content", :pro => true
      visit list_path(@list)
    end

    describe "GET /lists/:id/points" do
      it "should show points" do
        page.should have_content("test content")
      end
    end

    describe "POST /lists/point" do

      describe "with invalid information" do
        it "should not create a new point" do
          expect { click_button "Add Pro"}.not_to change(Point, :count)
        end
      end

      describe "with valid information" do
        before { fill_in 'point_content', with: "Lorem ipsum" }

        it "should create a new point" do
          expect { click_button "Add Pro"}.to change(Point, :count).by(1)
        end
      end # valid info

    end # creating points

    describe "DELETE /lists/point" do
      it "should delete point" do
        expect { click_link "delete_point" }.to change(Point, :count).by(-1)
      end
    end

  end

end
