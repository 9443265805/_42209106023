class Book < ActiveRecord::Base
  attr_accessible :author, :bookname, :category, :duedate, :lenddate, :price, :renewcount, :status, :booktype

belongs_to :user
end
