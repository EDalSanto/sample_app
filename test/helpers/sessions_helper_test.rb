require 'test_helper'

class SessionsHelperTest < ActionView::TestCase

  def setup
    @user = users(:michael) # Define a user var using the fixtures
    remember(@user) # Remember given user
  end

  test "current_user returns right user when session is nil" do
    assert_equal @user, current_user # Verify current_user is equal to given user
    assert is_logged_in?
  end

  test "current_user returns nil when remember digest is wrong" do
    @user.update_attribute(:remember_digest, User.digest(User.new_token))
  end
end
