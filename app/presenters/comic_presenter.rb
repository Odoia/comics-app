class ComicPresenter
  attr_reader :id, :title, :on_sale_date, :image_url, :favorite

  def initialize(attrs)
    @id           = attrs['id']
    @title        = attrs['title']
    @on_sale_date = attrs['dates']&.first['date'].to_date
    @image_url    = "#{attrs['thumbnail']['path']}.#{attrs['thumbnail']['extension']}"
    @favorite     = attrs['favorite'] || false #todo: implements a function to pick this on Db
    @character    = attrs['Character']
  end
end
