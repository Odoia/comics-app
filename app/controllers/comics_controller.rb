class ComicsController < ApplicationController
  include HTTParty
  base_uri 'https://gateway.marvel.com/v1/public'

  def index

    @options = { query: { ts: 123456789, apikey:'', hash: '21e2ae44ac88eedd70cb194384a265d7' } }
      result = self.class.get('/comics', @options)
      result
  end
end
