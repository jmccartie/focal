throw "You shouldn't be here" if Rails.env.production?

User.delete_all
Post.delete_all
Page.delete_all

puts "Creating user..."
FactoryGirl.create(:user, email: "test@user.com", password: "please")

puts "Creating posts..."
10.times do
  FactoryGirl.create(:post)
  FactoryGirl.reload
end

puts "Creating pages..."
3.times do |i|
  FactoryGirl.create(:page, sort_order: (i+1))
  FactoryGirl.reload
end

puts "Done."