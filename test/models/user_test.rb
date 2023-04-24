require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "invalid if email is empty" do
    user = User.new
    user.valid?
    assert_not user.errors[:email].empty?
  end

  test "valid if email is correctly formatted" do
    user = User.new(email: "test@example.com")
    user.valid?
    assert_empty user.errors[:email]
  end

  test "invalid if email is incorrectly formatted" do
    user = User.new(email: "test@example")
    user.valid?
    assert_not user.errors[:email].empty?
  end
end
