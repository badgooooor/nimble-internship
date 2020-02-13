class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: [:teacher, :student, :outsider]
  has_many :roleResources, dependent: :destroy

  has_many :course_user
  has_many :courses, :through => :course_user

  has_many :group_user
  has_many :groups, :through => :group_user
end