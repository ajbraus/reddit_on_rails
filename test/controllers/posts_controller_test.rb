require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
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
      params: { "post": { "title": "Awesome post", "body": "Hey you guys" } }
    assert_response :redirect
    follow_redirect!
    assert_response :success
  end

end
