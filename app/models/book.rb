class Book < ActiveRecord::Base
  attr_accessible :author, :bookname, :category, :duedate, :lenddate, :price, :renewcount, :status, :type

belongs_to :user
end
