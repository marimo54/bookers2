class BooksController < ApplicationController
   protect_from_forgery
  def create
    @book=Book.new(book_params)
    if @book.save
      redirect_to book_path(@book.id)
      flash[:complete]="Book was successfully created."
    else
      @books=Book.all
      render:index
    end
  end

  def index
    @books=Book.all
    @book=Book.new
  end

  def show
    @book=Book.find(params[:id])
  end



  def edit
    @book=Book.find(params[:id])
  end

  def update
    @book=Book.find(params[:id])
    if @book.update(book_params)
       redirect_to book_path(@book.id)
       flash[:complete] = "Book was successfully edited."
    else
       render:edit
    end
  end

  def  destroy
    @book=Book.find(params[:id])
    if @book.destroy
      redirect_to index_book_path
      flash[:complete]= "Book was successfully destroyed"
    end
  end

  def root
  end

  private
  def book_params
    params.require(:book).permit(:title,:body)
  end



end
