require 'spec_helper'

describe "Posts" do
  describe "Viewing" do
    before do
      @post = create(:post)
      visit post_path(@post)
    end

    context "when visiting" do
      it "lets me see the post" do
        page.should have_content(@post.title)
      end
    end

  end

  describe "Creating" do
    context "when logged in" do
      before do
        login
      end

      it "lets me create a new post" do
        visit new_post_path
        fill_in "Title", with: "Awesome Title"
        fill_in "Body", with: "Lipsum"
        click_button "Save"
        page.should have_content "Awesome Title"
        current_url.should match /awesome-title/
      end
    end

    context "when visiting" do
      it "doesn't let me edit" do
        visit new_post_path
        current_url.should == root_url
      end
    end
  end

  describe "Editing" do
    before do
      @post = create(:post)
    end

    context "when logged in" do
      before do
        login
      end

      it "allows me to edit" do
        visit post_path(@post)
        click_link "Edit"
        fill_in "Title", with: "Awesome Title 2"
        click_button "Save"
        page.should have_content "Awesome Title 2"
      end
    end

    context "when visiting" do
      it "doesn't let me edit" do
        visit post_path(@post)
        page.should_not have_content("Edit")
        visit edit_post_path(@post)
        current_url.should == root_url
      end
    end

  end

  describe "Removing" do
    before do
      @post = create(:post)
    end

    context "when logged in" do
      before do
        login
      end

      it "lets me delete", :js do
        visit post_path(@post)
        expect {
          click_link "Delete"
          confirm_popup
        }.to change(Post, :count).by(-1)
      end
    end

    context "when visiting" do
      it "doesn't let me delete" do
        visit post_path(@post)
        page.should_not have_content("Delete")
      end
    end
  end

end