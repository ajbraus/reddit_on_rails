require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest

  def setup 
    @post = posts(:one)
  end

  test "should get index" do
    get root_url
    assert_response :success
  end

  test "should view new post form" do
    get new_post_url
    assert_response :success
  end

  test "should create new post" do 
    post posts_url,
      params: { "post": { "title": @post.title, "body": @post.body, "url": @post.url } }
    assert_response :redirect
    follow_redirect!
    assert_response :success
  end

  test "should be able to view individual post" do
    get post_url(@post.id)
    assert_response :success
  end

end
