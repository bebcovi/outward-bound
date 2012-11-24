require "spec_helper_full"

describe "Posts" do
  before(:all) { create_list(:post, 6) }
  before(:each) { visit root_path }

  they "can be viewed" do
    within("nav") { click_on "News" }
    current_path.should eq posts_path
  end

  they "are paginated" do
    visit posts_path

    posts = Post.all
    last_post = posts.pop

    posts.each { |post| page.should have_content(post.title) }
    page.should_not have_content(last_post.title)

    within(".pagination") { click_on "Next" }
    posts.each { |post| page.should_not have_content(post.title) }
    page.should have_content(last_post.title)
  end
end
