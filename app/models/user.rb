class User < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  has_many :posts

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable, :omniauthable

  def display_name
    name.blank? ? email : name
  end

  def self.from_omniauth(auth)  
    where(email: auth.info.email).first_or_create do |user|
      user.provider = auth.provider
      user.uid      = auth.uid
      user.password = Devise.friendly_token[0,20]
    end
  end
end
