class BooksController < ApplicationController

def index
@books = Book.where(:status=>nil)
@books_count=@books.count
@books=@books.paginate(:page => params[:page], :per_page => 5)
end

def new
	@book=Book.new
end

def create
	@book=Book.new(params[:book])
	@book.renewcount=0
	@book.fine=0
	if @book.save
     redirect_to @book
	else 
		render action: "new"
	end
end

def edit
	@book=Book.find(params[:id])
end

def update
	@book=Book.find(params[:id])
	if @book.update_attributes(params[:book])
		redirect_to @book
	else 
		render action: "edit"

	end
end

def show
	@book=Book.find(params[:id])
end

def destroy	
	@book=Book.find(params[:id])
	@book.destroy
	redirect_to books_path
end

def userbookportal
@books=current_user.books

@books.each do |book|
	
	book.fine=book.fine.to_i + book.calcfine.to_i
	book.save
end
end

def adminbookportal
@books=Book.where("user_id != ?", "nil")

end


def takebook
if current_user.books.count<=3	

@book=Book.find(params[:id])
@book.user_id=current_user.id
@book.lenddate=Date.today
@book.duedate=@book.lenddate+15.days
@book.status="available"
if @book.save
	redirect_to action: "userbookportal"
else
 redirect_to action: :index 
end

else
	redirect_to :back ,notice: "You can take only 3 books"
end
end


def renew
@book=Book.find(params[:id])
@book.renewcount+=1
if @book.renewcount > 3
	redirect_to :back ,notice: "No of renew count exceeded.You can only return the book"
else
@book.lenddate=Date.today
@book.duedate=@book.lenddate+15.days
@book.save
redirect_to :back ,notice: "Book renewed sucessfully"
end 

end


def pay
@book=Book.find(params[:id])
@book.fine=0
@book.save
redirect_to :back ,notice: "Fine payed sucessfully"
end
	

def return

@book=Book.find(params[:id])
if @book.fine == 0
@book.renewcount=0
@book.lenddate=nil
@book.duedate=nil
@book.user_id=nil
@book.status=nil
@book.save
redirect_to :back ,notice: "Book returned sucessfully"

else
	redirect_to :back ,notice: "You have pay your fine"
end

end
end