module Favorite
  class Add

    def initialize(comic_id:)
      @comic_id = comic_id
    end

    def call
      add_to_favorite
    end

    private

    attr_reader :current_user, :comic_id

    def add_to_favorite
      if current_user.favorite.nil?
        current_user.favorite = [comic_id.to_i]
      else
        current_user.favorite.push(comic_id.to_i)
      end

      current_user.save
    end

    def current_user
      @current_user ||= Current.user
    end
  end
end
