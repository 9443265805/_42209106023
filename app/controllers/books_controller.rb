class BooksController < ApplicationController

def index
@books = Book.all.paginate(:page => params[:page], :per_page => 5)
end

def new
	@book=Book.new
end

def create
	@book=Book.new(params[:book])
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
	@book=@book=Book.find(params[:id])
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
end

def adminbookportal
end

end