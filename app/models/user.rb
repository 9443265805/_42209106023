class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  # Setup accessible (or protected) attributes for your model
  attr_accessible  :name, :age, :email, :password, :password_confirmation, :remember_me, :role, :phonenumber , :school , :avatar , :current_password
  # attr_accessible :title, :body
  validates_presence_of :name ,:age, :phonenumber, :school 
  validates :phonenumber , format: { with: /^[0-9]{10}$/, message: " must be 10 digits" }

   has_many :conversations, :foreign_key => :sender_id

   has_attached_file :avatar, :styles => { :small => "43x43>" , :medium => "600x600>" }, 
                  :processors => [:cropper] ,
                  :url  => "/assets/users/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/users/:id/:style/:basename.:extension"


validates_attachment_size :avatar, :less_than => 5.megabytes
validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/png']

 
  

  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  after_update :reprocess_avatar, :if => :cropping?
  
  def cropping?
    !crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank?
  end
  
  def avatar_geometry(style = :original)
    @geometry ||= {}
    @geometry[style] ||= Paperclip::Geometry.from_file(avatar.path(style))
  end
  
  private
  
  def reprocess_avatar
    avatar.reprocess!
  end
end

