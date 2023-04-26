require "test_helper"

class UserTest < ActiveSupport::TestCase
  # Test for user factory
  test "valid user" do
    user = build(:user)
    assert user.valid?
  end
  
  # Tests for email
  test "invalid user if email is empty" do
    user = User.new
    user.valid?
    assert_not user.errors[:email].empty?
  end

  test "valid user if email is correctly formatted" do
    user = User.new(email: "test@example.com")
    user.valid?
    assert_empty user.errors[:email]
  end

  test "invalid user if email is incorrectly formatted" do
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
  test "invalid user if password is empty" do
    user = User.new
    user.valid?
    assert_not user.errors[:password].empty?
  end

  test "valid user if password has length equal or greater than 8" do
    user = User.new(password: "12345678")
    user.valid?
    assert_empty user.errors[:password]
  end

  test "invalid user if password has length less than 8" do
    user = User.new(password: "1234567")
    user.valid?
    assert_not user.errors[:password].empty?
  end

  test "password is encrypted" do
    user = User.new(password: "password")
    assert_not_equal "password", user.encrypted_password
  end

  # Tests for username
  test "valid user if username is present" do
    user = User.new(username: "username")
    user.valid?
    assert_empty user.errors[:username]
  end
  
  test "invalid user if username is empty" do
    user = User.new
    user.valid?
    assert_not user.errors[:username].empty?
  end

  test "username should be unique" do
    create(:user)
    user = build(:user)
    user.valid?
    assert_not user.errors[:username].empty?
  end

  # Tests for firstname
  test "valid user if firstname is present" do
    user = User.new(firstname: "Jane")
    user.valid?
    assert_empty user.errors[:firstname]
  end

  test "invalid user if firstname is empty" do
    user = User.new
    user.valid?
    assert_not user.errors[:firstname].empty?
  end

  # Tests for lastname
  test "valid user if lastname is present" do
    user = User.new(lastname: "Doe")
    user.valid?
    assert_empty user.errors[:lastname]
  end

  test "invalid user if lastname is empty" do
    user = User.new
    user.valid?
    assert_not user.errors[:lastname].empty?
  end

  # Tests for dob
  test "valid user if dob is present" do
    user = User.new(dob: "2000-1-31")
    user.valid?
    assert_empty user.errors[:dob]
  end

  test "invalid user if dob is empty" do
    user = User.new
    user.valid?
    assert_not user.errors[:dob].empty?
  end

  test "invalid user if dob is not correctly formatted" do
    user = User.new(dob: "2000-31-1")
    user.valid?
    assert_not user.errors[:dob].empty?
  end

  # Tests for gender
  test "valid user if gender is 'female', 'male', 'other' or 'prefer_not_to_say" do
    genders = %w[female male other prefer_not_to_say]
    genders.each do |gender|
      user = User.new(gender:)
      user.valid?
      assert_empty user.errors[:gender]
    end
  end

  test "invalid user if gender is invalid" do
    assert_raises ArgumentError do
      User.new(gender: "invalid")
    end
  end

  test "invalid user if gender is empty" do
    user = User.new
    user.valid?
    assert_not user.errors[:gender].empty?
  end

  # Tests for country
  test "valid user if country is present" do
    user = User.new(country: "SGP")
    user.valid?
    assert_empty user.errors[:country]
  end

  test "invalid user if country is empty" do
    user = User.new
    user.valid?
    assert_not user.errors[:country].empty?
  end

  # Tests for role
  test "valid user if role is 'user', 'owner' or 'admin'" do
    roles = %w[user owner admin]
    roles.each do |role|
      user = User.new(role:)
      user.valid?
      assert_empty user.errors[:role]
    end
  end

  test "invalid user if role is invalid" do
    assert_raises ArgumentError do
      User.new(role: "invalid")
    end
  end

  test "invalid user if role is empty" do
    user = User.new
    user.valid?
    assert_not user.errors[:role].empty?
  end
end
