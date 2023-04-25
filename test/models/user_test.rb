require "test_helper"

class UserTest < ActiveSupport::TestCase
  # Test for user factory
  test "valid user" do
    user = build(:user)
    assert user.valid?
  end
  
  # Tests for email
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

  test "email should be unique" do
    create(:user)
    user = build(:user)
    user.valid?
    assert_not user.errors[:email].empty?
  end

  # Tests for password
  test "invalid if password is empty" do
    user = User.new
    user.valid?
    assert_not user.errors[:password].empty?
  end

  test "valid if password has length equal or greater than 8" do
    user = User.new(password: "12345678")
    user.valid?
    assert_empty user.errors[:password]
  end

  test "invalid if password has length less than 8" do
    user = User.new(password: "1234567")
    user.valid?
    assert_not user.errors[:password].empty?
  end

  test "password is encrypted" do
    user = User.new(password: "password")
    assert_not_equal "password", user.encrypted_password
  end

  # Tests for username
  test "valid if username is present" do
    user = User.new(username: "username")
    user.valid?
    assert_empty user.errors[:username]
  end
  
  test "invalid if username is empty" do
    user = User.new
    user.valid?
    assert_not user.errors[:username].empty?
  end

  test "username should be unique" do
    create(:user)
    user = build(:user, email: "test@example.com")
    user.valid?
    assert_not user.errors[:username].empty?
  end
end
