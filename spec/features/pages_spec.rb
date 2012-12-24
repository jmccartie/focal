require 'spec_helper'

describe "Pages" do
  describe "Viewing" do
    before do
      @page = create(:page)
      visit page_path(@page)
    end

    context "when visiting" do
      it "lets me see the page" do
        page.should have_content(@page.title)
      end
    end

  end

  describe "Creating" do
    context "when logged in" do
      before do
        login
      end

      it "lets me create a new page" do
        visit new_page_path
        fill_in "Title", with: "Awesome Title"
        fill_in "Body", with: "Lipsum"
        click_button "Save"
        page.should have_content "Awesome Title"
        current_url.should match /awesome-title/
      end
    end

    context "when visiting" do
      it "doesn't let me edit" do
        visit new_page_path
        current_url.should == root_url
      end
    end
  end

  describe "Editing" do
    before do
      @page = create(:page)
    end

    context "when logged in" do
      before do
        login
      end

      it "allows me to edit" do
        visit page_path(@page)
        click_link "Edit"
        fill_in "Title", with: "Awesome Title 2"
        click_button "Save"
        page.should have_content "Awesome Title 2"
      end
    end

    context "when visiting" do
      it "doesn't let me edit" do
        visit page_path(@page)
        page.should_not have_content("Edit")
        visit edit_page_path(@page)
        current_url.should == root_url
      end
    end

  end

  describe "Removing" do
    before do
      @page = create(:page)
    end

    context "when logged in" do
      before do
        login
      end

      it "lets me delete", :js do
        visit page_path(@page)
        expect {
          click_link "Delete"
          confirm_popup
        }.to change(Page, :count).by(-1)
      end
    end

    context "when visiting" do
      it "doesn't let me delete" do
        visit page_path(@page)
        page.should_not have_content("Delete")
      end
    end
  end

end