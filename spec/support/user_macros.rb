module UserMacros

  def login(user=nil)
    user ||= create(:user, password: "please")
    visit login_path
    fill_in "Email", with: user.email
    fill_in "Password", with: "please"
    click_button "Log in"
  end

  def logout
    click_link "Log out"
  end

end