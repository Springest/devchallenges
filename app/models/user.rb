class User < ActiveRecord::Base
  has_surveys
  has_many :identities
  has_many :challenge_attempts
  TEMP_EMAIL = 'change@me.com'
  TEMP_EMAIL_REGEX = /change@me.com/

  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_format_of :email, :without => TEMP_EMAIL_REGEX, on: :update

  def self.find_for_oauth(auth, signed_in_resource = nil)

    identity = Identity.find_for_oauth(auth)
    user = identity.user
    if user.nil?
      email = auth.info.email if auth.info.verified_email
      user = User.where(:email => email).first if email

      if user.nil?
        user = User.new(
          name: auth.extra.raw_info.name,
          username: auth.info.nickname || auth.uid,
          email: email ? email : TEMP_EMAIL,
          password: Devise.friendly_token[0,20]
        )
        #Users are not required to be confirmed, and the confirmable module is not loaded, so this does not evaluate
        #user.skip_confirmation!
        user.save!
      end

      if identity.user != user
        identity.user = user
        identity.save!
      end
    end
    user
  end
end
