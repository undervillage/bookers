class ChatsController < ApplicationController
  before_action :reject_non_related, only: [:show]

  def show
    @user = User.find(params[:id])
    @chats = Chat.where(speaker: current_user, replyer: @user)
                  .or(Chat.where(speaker: @user, replyer: current_user))
                  .order(:updated_at)
  end

  def create
    @chat = Chat.new
    @chat.speaker_id = params[:speaker_id]
    @chat.replyer_id = params[:replyer_id]
    @chat.message = params[:message]
    @chat.save!
  end

  private

  def reject_non_related
    user = User.find(params[:id])
    unless current_user.following?(user) && user.following?(current_user)
      redirect_to books_path
    end
  end
end
