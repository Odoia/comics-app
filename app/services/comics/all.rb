module Comics
  class All < Base

    def call
      result = self.class.get('/comics', query_params)
      return result unless result['code'] == 200

      comic_presenter(result)
    end

    private

    def query_params
      { query: auth.merge(orderBy: '-onsaleDate') }
    end
  end
end
