Given(/^there's a post titled "(.*?)" with "(.*?)" content$/) do |name, description|
  # pending # express the regexp above with the code you wish you had
  @post = FactoryGirl.create(:post, name: name, description: description)
end

When(/^I am on the homepage$/) do
  # pending # express the regexp above with the code you wish you had
  visit root_path
end

Then(/^I should see the "(.*?)" post$/) do |name|
  # pending # express the regexp above with the code you wish you had
  @post = Post.find_by_name(name)

  page.should have_content(@post.name)
  page.should have_content(@post.description)
end
