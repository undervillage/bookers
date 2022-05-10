class BookCommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:destroy]

  def create
    book_comment = current_user.book_comments.new(book_comment_params)
    unless book_comment.save
      redirect_back fallback_location: root_path, notice: book_comment.errors
    end
    @book_comments = Book.find(params[:book_id]).book_comments
  end

  def destroy
    book_comment = BookComment.find(params[:id])
    book_comment.destroy
    @book_comments = Book.find(book_comment.book_id).book_comments
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:content).merge(book_id: params[:book_id])
  end

  def ensure_correct_user
    book_comment = BookComment.find(params[:id])
    return if book_comment.user_id == current_user.id
    redirect_back fallback_location: root_path, notice: "Not authorized"
  end
end
