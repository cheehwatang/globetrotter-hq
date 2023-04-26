class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum gender: %i[female male other prefer_not_to_say]
  enum role: %i[user owner admin]
         
  validates :username, presence: true, uniqueness: true
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :dob, presence: true
  validates :gender, presence: true
  validates :country, presence: true
  validates :role, presence: true
end
