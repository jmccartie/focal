require 'spec_helper'

describe "Statuses" do
  describe "Viewing" do
    before do
      @status = create(:status)
      visit status_path(@status)
    end

    context "when visiting" do
      it "lets me see the status" do
        page.should have_content(@status.body.split("\n").first)
      end
    end

  end

  describe "Creating" do
    context "when logged in" do
      before do
        login
      end

      it "lets me create a new status" do
        visit new_status_path
        fill_in "Body", with: "Lipsum"
        click_button "Save"
        page.should have_content "Lipsum"
      end
    end

    context "when visiting" do
      it "doesn't let me edit" do
        visit new_status_path
        current_url.should == root_url
      end
    end
  end

  describe "Editing" do
    before do
      @status = create(:status)
    end

    context "when logged in" do
      before do
        login
      end

      it "allows me to edit" do
        visit status_path(@status)
        click_link "Edit"
        fill_in "Body", with: "Lipsum"
        click_button "Save"
        page.should have_content "Lipsum"
      end
    end

    context "when visiting" do
      it "doesn't let me edit" do
        visit status_path(@status)
        page.should_not have_content("Edit")
        visit edit_status_path(@status)
        current_url.should == root_url
      end
    end

  end

  describe "Removing" do
    before do
      @status = create(:status)
    end

    context "when logged in" do
      before do
        login
      end

      it "lets me delete", :js do
        visit status_path(@status)
        expect {
          click_link "Delete"
          confirm_popup
        }.to change(Status, :count).by(-1)
      end
    end

    context "when visiting" do
      it "doesn't let me delete" do
        visit status_path(@status)
        page.should_not have_content("Delete")
      end
    end
  end

end