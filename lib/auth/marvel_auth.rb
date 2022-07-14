module Auth
  class MarvelAuth

    def initialize
      @private_key = ENV['MARVEL_PRIVATE_KEY']
      @public_key = ENV['MARVEL_PUBLIC_KEY']
    end

    def call
      timestamp = Time.now.to_i
      md5_hash = Digest::MD5.hexdigest("#{timestamp}#{@private_key}#{@public_key}")

      {
        ts: timestamp,
        apikey: @public_key,
        hash: md5_hash
      }
    end
  end
end
