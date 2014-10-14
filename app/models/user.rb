class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible  :name, :age, :email, :password, :password_confirmation, :remember_me, :role, :phonenumber , :school , :avatar
  # attr_accessible :title, :body
  validates_presence_of :name ,:age, :phonenumber, :school 
  validates :phonenumber , format: { with: /^[0-9]{10}$/, message: " must be 10 digits" }

   has_many :conversations, :foreign_key => :sender_id
   has_many :books
   has_attached_file :avatar, :styles => { :small => "40x40>" , :medium => "600x600>" }, 
                  :url  => "/assets/users/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/users/:id/:style/:basename.:extension"


validates_attachment_size :avatar, :less_than => 5.megabytes
validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/png']

 
  

end

