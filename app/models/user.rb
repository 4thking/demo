class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, :length => { :maximum => 10 }, presence: true

  acts_as_messageable

 def mailboxer_email(object)
  email
end

  has_one :profile, dependent: :destroy
end
