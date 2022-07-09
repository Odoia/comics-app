module Character
  class ByName
    include HTTParty
    base_uri 'https://gateway.marvel.com/v1/public'

    attr_accessor :character

    def initialize(character:)
      @character = character
    end

    def call

      result = self.class.get('/characters', { query: auth.merge(name: character) })

      result['data']['results']&.first['id']
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

