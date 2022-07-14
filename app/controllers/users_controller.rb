class UsersController < ApplicationController

  def update_favorite
    if true?(user_params[:favorite_value])
      remove_comic_from_favorite
    else
      add_comic_to_favorite
    end
  end

  private

  def user_params
    return nil if params['comic_id'].blank? || params['favorite_value'].blank?

    params.permit(:comic_id, :favorite_value)
  end

  def add_comic_to_favorite
    ::Favorite::Add.new(comic_id: user_params[:comic_id]).call
  end

  def remove_comic_from_favorite
    ::Favorite::Remove.new(comic_id: user_params[:comic_id]).call
  end

  def true?(obj)
    obj.to_s.downcase == 'true'
  end
end
