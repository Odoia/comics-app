require 'rails_helper'

describe ::Comics::ByCharacter  do
  subject { ::Comics::ByCharacter.new(character: character_name) }


  let(:character_name) { 'deadpool' }

  context 'When get all comics by a valid character' do
    context 'When pass a valid param' do
      before do
        allow(Comics::ByCharacter).to receive(:get).with('/characters', Hash).and_return(JSON.parse(file_fixture('character.json').read))
        allow(Comics::ByCharacter).to receive(:get).with('/comics', Hash).and_return(JSON.parse(file_fixture('comics.json').read))
      end

      it 'should be return a mapped data' do
        result = subject.call

        expect(result.first.id).to be_kind_of Integer
        expect(result.first.title).to be_kind_of String
        expect(result.first.image_url).to be_kind_of String
        expect(result.first.on_sale_date).to be_kind_of Date
      end
    end
  end
end

