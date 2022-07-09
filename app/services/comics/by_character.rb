module Comics
  class ByCharacter
    include HTTParty
    base_uri 'https://gateway.marvel.com/v1/public'

    attr_accessor :character

    def initialize(character:)
      @character = character
    end

    def call
      result = self.class.get('/comics', { query: auth.merge(characters: characters_id_by(character)) } )

      return result unless result['code'] == 200

      comic_presenter(result)
    end


    def characters_id_by(character)
      result = self.class.get('/characters', { query: auth.merge(name: character) })

      result['data']['results']&.first['id']
    end

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
