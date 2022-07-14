class ComicsController < ApplicationController

  def index
    @comics = all_comics
  end

  def search
    if comic_params.blank?
      @comics = index
      return render 'index'
    end

    @comics = all_by_name
  end

  def set_favorite
    # require 'pry'; binding.pry
    
  end

  private

  def comic_params
    return nil if params['character'].blank?

    params.require(:character)
  end

  def all_by_name
    @all_by_name ||= ::Comics::ByCharacter.new(character: comic_params).call
  end

  def all_comics
    @all_comics ||= ::Comics::All.new.call
  end
end
