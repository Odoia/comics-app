module Favorite
  class Update

    def initialize(comic_id:)
      @comic_id = comic_id
    end

    def call
      require 'pry'; binding.pry
    end


  end
end
