class BookCommentsController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    comment = current_user.book_comments.new(book_comment_params)
    comment.book_id = @book.id
    if comment.save
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @book_comment = BookComment.find(params[:book_id]).destroy
    @book = @book_comment.book
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
end
