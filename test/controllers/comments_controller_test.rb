require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @post = posts(:one)
    @comment = comments(:one)
  end

  test "should create comment" do
    assert_difference 'Comment.count' do
      post post_comments_url(@post), params: { "comment": { "body": @comment.body } }
      assert_response :redirect
      follow_redirect!
      assert_response :success
    end
  end

end
