class ComicsController < ApplicationController

  def index
    @comics = all_comics
  end

  def search
    if comic_params.blank?
      @comics = all_comics
      return render 'index'
    end

    @comics = all_by_name
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
