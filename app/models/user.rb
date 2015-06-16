class User < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader

  has_secure_password 
  has_many :posts

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def display_name
    name.blank? ? email : name
  end
end
