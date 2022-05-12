class HomesController < ApplicationController
  before_action :ensure_correct_user, only: [:top]

  def top
  end
  
  def about
  end

  def ensure_correct_user
    if current_user
      redirect_to user_path(current_user)
    end
  end
end
