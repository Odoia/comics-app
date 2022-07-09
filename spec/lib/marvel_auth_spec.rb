require 'rails_helper'

describe ::Auth::MarvelAuth do

  context 'When auth on marvel api' do
    context 'When pass a valid param' do
      before do
        allow(Time).to receive(:now).and_return(1657378196)
        allow(Auth::MarvelAuth).to receive(:initialize).and_return(
          ENV['MARVEL_PRIVATE_KEY'] = 'zxcdsa123',
          ENV['MARVEL_PUBLIC_KEY'] = 'ioplkj890'
        )
      end

      it 'should be return a filtered data' do
        response_hash = Digest::MD5.hexdigest('1657378196zxcdsa123ioplkj890')
        result = subject.call

        expect(result).to be_kind_of Hash
        expect(result).to include(:ts)
        expect(result).to include(:apikey)
        expect(result).to include(:hash)
        expect(result[:hash]).to eq response_hash
      end
    end
  end
end

