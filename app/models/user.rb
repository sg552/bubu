class User < ActiveRecord::Base
  ROLE_ADMIN = "admin"
  ROLE_USER = "user"
  options = []
  (1..9).each do |i|
    text = i == 9 ? "岁以上" : "岁"
    options << ["#{i}#{text}", "#{i}"]
  end
  OPTIONS_FOR_AGE = options
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :role,
    :baby_age, :baby_gender, :introduction, :login

  has_many :comments
  has_many :favorites
  has_many :user_images

  def admin?
    role == ROLE_ADMIN
  end
  def normal_user?
    role == ROLE_USER
  end
  def logo
    user_images.first
  end
end
