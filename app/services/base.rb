class Base
  include HTTParty
  base_uri ENV['COMIC_BASE_URI']

  private

  attr_reader :parameters

  def comic_presenter(comics)
    comics['data']['results'].map do |comic|
      ::ComicPresenter.new(comic)
    end
  end

  def auth
    ::Auth::MarvelAuth.new.call
  end
end
