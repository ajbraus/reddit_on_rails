require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  def setup 
    @user = users(:one)
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post users_path, params: { "user": { "email": @user.email, "password": "password", "confirm_password": "password" } }
      assert_response :redirect
      follow_redirect!
      assert_response :success  
    end
  end  

end
