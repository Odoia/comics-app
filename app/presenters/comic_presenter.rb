class ComicPresenter
  attr_reader :id, :title, :on_sale_date, :image_url, :favorite

  def initialize(attrs)
    @id           = attrs['id']
    @title        = attrs['title']
    @on_sale_date = attrs['dates']&.first['date'].to_date
    @image_url    = "#{attrs['thumbnail']['path']}.#{attrs['thumbnail']['extension']}"
    @favorite     = set_favorite(@id)
    @character    = attrs['Character']
  end

  private

  def set_favorite(id)
    array_favorite = Current.user.favorite

    return false if array_favorite.nil?

    array_favorite.include?(id)
  end
end
