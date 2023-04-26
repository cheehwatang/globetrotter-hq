FactoryBot.define do
  factory :user do
    email { "jane@doe.com" }
    password { "password" }
    username { "JaneDoe" }
    firstname { "Jane" }
    lastname { "Doe" }
    dob { Date.new(2000, 1, 31) }
    gender { "female" }
    country { "SG" }
    role { 0 }
  end
end
