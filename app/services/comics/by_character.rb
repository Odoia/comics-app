module Comics
  class ByCharacter < All

    def initialize(character:)
      super()
      @character = character
    end

    private

    attr_reader :character

    def query_params
      { query: auth.merge(characters: character_id, orderBy: '-onsaleDate') }
    end

    def character_id
      @character_id ||= ::Character::ByName.new(character: character).call
    end
  end
end
