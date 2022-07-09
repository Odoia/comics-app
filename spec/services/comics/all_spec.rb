require 'rails_helper'

describe ::Comics::All  do

  context 'When get all comics' do
    context 'When pass a valid param' do
      before do
        allow(Comics::All).to receive(:get).and_return(JSON.parse(file_fixture("comics.json").read))
      end

      it 'should be return status 200' do
        result = subject.call

        expect(result.first.id).to be_kind_of Integer
        expect(result.first.title).to be_kind_of String
        expect(result.first.image_url).to be_kind_of String
        expect(result.first.on_sale_date).to be_kind_of Date
        expect(result.first.id).to eq 82967
        expect(result.first.title).to eq 'Marvel Previews (2017)'
        expect(result.first.image_url).to eq 'http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available.jpg'
      end
    end
  end
end

