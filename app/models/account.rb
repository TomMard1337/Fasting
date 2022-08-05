class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
        :omniauthable, omniauth_providers: [:github, :google_oauth2]
 validates :name, :length => { :maximum => 70 }
 validates :name, :length => { :minimum => 6 }
  has_many :addfasts

  def self.from_omniauth(access_token)
    account = Account.where(email: access_token.info.email).first
    unless account
      account = Account.create(
        email: access_token.info.email,
        password: Devise.friendly_token[0,20]
      )
    end
    account.name = access_token.info.name
    account.image = access_token.info.image
    account.uid = access_token.uid
    account.provider = access_token.provider
    account.save

    account
  end
end
