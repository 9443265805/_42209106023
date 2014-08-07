class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible  :name, :age, :email, :password, :password_confirmation, :remember_me, :role, :phonenumber 
  # attr_accessible :title, :body
  validates_presence_of :name ,:age, :phonenumber
  validates :phonenumber , format: { with: /^[0-9]{10}$/, message: " must be 10 digits" }
end
