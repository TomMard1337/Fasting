class Account < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
        :omniauthable, omniauth_providers: [:google_oauth2]
 validates :name, :length => { :maximum => 70 }
 validates :name, :length => { :minimum => 6 }
  has_many :addfasts
 validates :date_of_birth, presence: true
 validate :validate_age

 def validate_age
     if date_of_birth.present? && date_of_birth > 13.years.ago.to_s
         errors.add(:Error, 'You should be over 13 years old.')
     end
 end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |account|
      account.email = auth.info.email
      account.password = Devise.friendly_token[0, 20]
      account.name = auth.info.name # assuming the account model has a name
      account.image = auth.info.image # assuming the account model has an image
      # If you are using confirmable and the provider(s) you use validate emails,
      # uncomment the line below to skip the confirmation emails.
      # account.skip_confirmation!
    end
  end
end
