class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    favorite = current_user.favorites.build(favorite_params)
    @book = favorite.book
    if favorite.save
      respond_to :js
    end
  end
  
  def destroy
    favorite = Favorite.find_by(user_id: current_user.id, book_id: params[:book_id])
    @book = favorite.book
    favorite.destroy if favorite.present?

    if favorite.destroyed?
      respond_to :js
    end
  end
  
  private

    def favorite_params
      params.permit(:book_id)
    end
end
