module Comics
  class All
    include HTTParty
    base_uri 'https://gateway.marvel.com/v1/public'

    def call
      @options = { query: auth }
      result = self.class.get('/comics', @options)

      return result unless result['code'] == 200

      comic_presenter(result)
    end

    private

    def comic_presenter(comics)
      comics['data']['results'].map do |comic|
        ::ComicPresenter.new(comic)
      end
    end

    def auth
      {
        ts: 123456789,
        apikey:'',
        hash: '21e2ae44ac88eedd70cb194384a265d7'
      }
    end
  end
end
