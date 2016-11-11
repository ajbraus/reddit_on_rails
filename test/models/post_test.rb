require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test "has proper validations" do
    @post = Post.new()
    assert_not @post.valid?
  end
end
