# test/models/user_test.rb
require 'test_helper'

class UserTest < ActiveSupport::TestCase
  class UserTest < ActiveSupport::TestCase

  def create_valid_user(first_name, last_name)
    User.new(first_name: first_name, last_name: last_name, email: "john@example.com", password: "password")
  end

  test "should not save user without first_name" do
    user = create_valid_user(nil, "Doe")
    assert_not user.valid?
    assert_includes user.errors[:first_name], "can't be blank"
  end

  test "should not save user without last_name" do
    user = create_valid_user("John", nil)
    assert_not user.valid?
    assert_includes user.errors[:last_name], "can't be blank"
  end

  test "should save user with first_name and last_name" do
    user = create_valid_user("John", "Doe")
    assert user.valid?
    assert user.save, "Failed to save the user with first_name and last_name"
  end

end
end
