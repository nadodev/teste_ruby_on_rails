require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
    @author = authors(:one)
  end

  test "should get index" do
    post_params = { title: "Test Post", content: "Lorem ipsum...", author_id: @author.id }
    Post.create(post_params)

    get posts_url
    assert_response :success
  end
end