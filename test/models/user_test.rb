# test/models/user_test.rb
require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should not save user without first_name" do
    user = User.new(last_name: "Doe", email: "john@example.com", password: "password")
    assert_not user.save, "Saved the user without a first_name"
  end

  test "should not save user without last_name" do
    user = User.new(first_name: "John", email: "john@example.com", password: "password")
    assert_not user.save, "Saved the user without a last_name"
  end

  test "should save user with first_name and last_name" do
    user = User.new(first_name: "John", last_name: "Doe", email: "john@example.com", password: "password")
    assert user.save, "Failed to save the user with first_name and last_name"
  end
end
