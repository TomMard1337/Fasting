class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
 validates :name, :length => { :maximum => 70 }
 validates :name, :length => { :minimum => 6 }
  has_many :addfasts
end
