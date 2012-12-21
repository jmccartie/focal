require 'spec_helper'

describe "Users" do
  before do
    @user = create(:user, password: "please")
  end

  describe "Login" do
    context "with valid credentials" do
      it "allows me to login" do
        login(@user)
        page.should have_content("Log out")
      end
    end

    context "with invalid credentials" do
      it "allows me to login" do
        visit login_path
        click_button "Log in"
        page.should have_content("invalid")
        page.should_not have_content("Log out")
      end
    end
  end

  describe "Logout" do
    it "allows me to logout" do
      login(@user)
      logout
      page.should_not have_content("Log out")
    end
  end

end