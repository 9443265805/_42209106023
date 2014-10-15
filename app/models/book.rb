class Book < ActiveRecord::Base
  attr_accessible :author, :bookname, :category, :duedate, :lenddate, :price, :renewcount, :status, :booktype ,:fine, :efile
validates_presence_of :author, :bookname, :price
has_attached_file :efile ,:url  => "/assets/books/:id/:basename.:extension",
                  :path => ":rails_root/public/assets/books/:id/:basename.:extension"

belongs_to :user

do_not_validate_attachment_file_type :efile
end
