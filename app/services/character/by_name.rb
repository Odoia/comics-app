module Character
  class ByName < Base

    def initialize(character:)
      super()
      @character = character
    end

    def call
      response = self.class.get('/characters', query_params)

      return nil if response['data']['results'].blank?

      response['data']['results'].first['id']
    end

    private

    attr_reader :character

    def query_params
      { query: auth.merge(name: character) }
    end
  end
end
