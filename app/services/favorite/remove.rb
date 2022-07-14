module Favorite
  class Remove

    def initialize(comic_id:)
      @comic_id = comic_id
    end

    def call
      remove_from_favorite
    end

    private

    attr_reader :current_user, :comic_id

    def remove_from_favorite
      return nil if current_user.favorite.nil?

      current_user.favorite.delete(comic_id.to_i)
      current_user.save
    end

    def current_user
      @current_user ||= Current.user
    end
  end
end
