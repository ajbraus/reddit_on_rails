require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test "has proper validations" do
    @comment = Comment.new()
    assert_not @comment.valid?
  end
end
