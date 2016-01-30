class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]






def self.from_omniauth(auth)
  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    binding.pry
    user.email = auth.uid+"@facebook.com"
    user.password = Devise.friendly_token[0,20]
    user.name = auth.info.name
    user.oauth_token = auth.credentials.oauth_token
    user.oauth_expires_at = Time.at(auth.credentials.expires_at)
    user.save!   # assuming the user model has a name
    #user.image = auth.info.image # assuming the user model has an image
  end
end

def self.new_with_session(params, session)
     super.tap do |user|
       if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
         user.email = data["email"] if user.email.blank?
       end
     end
 end

def facebook
  @facebook ||= Koala::Facebook::API.new(oauth_token)
end


def friends
  facebook.get_connections("me", "friends")
end



end
