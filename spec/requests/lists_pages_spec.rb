require 'spec_helper'

describe "List Pages" do
  subject { page }

  it "should display lists" do
    @list = List.create :name => "Test List 1"
    visit root_path
    page.should have_content('Test List 1')
  end

  describe "list creation" do

    before { visit root_path }

    describe "with invalid information" do 
      it "should not create a new list" do
        expect { click_button "Create List" }.not_to change(List, :count)
      end
    end

    describe "with valid information" do
      before { fill_in 'list_name', with: "Lorem ipsum"}
      it "should create a new list" do
        expect { click_button "Create List"}.to change(List, :count).by(1)
      end
    end

  end

  describe "list destruction" do
    before do 
      @list = List.create :name => "Test List 2" 
      visit list_path(@list)
    end
    it "should delete list" do
      expect { click_link "delete" }.to change(List, :count).by(-1)
    end
  end

end
