# frozen_string_literal: true

class HomesController < ApplicationController
  def index
    if user_signed_in?
      @posts = current_user.posts.order('created_at DESC')
    else
      redirect_to new_user_session_path
    end
  end
end
