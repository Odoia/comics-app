module Character
  class ByName < Base

    def initialize(character:)
      super()
      @character = character
    end

    def call
      result = self.class.get('/characters', query_params)
      result['data']['results']&.first['id']
    end

    private

    attr_reader :character

    def query_params
      { query: auth.merge(name: character) }
    end
  end
end
