module Comics
  class All
    include HTTParty
    base_uri 'https://gateway.marvel.com/v1/public'

    def call
      @options = { query: auth }
      result = self.class.get('/comics', @options)
      result
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
