require 'rails_helper'

describe ::Character::ByName  do
  subject { ::Character::ByName.new(character: character_name) }

  let(:character_name) { 'deadpool' }

  context 'When get a id character by name' do
    context 'When pass a valid param' do
      before do
        allow(Character::ByName).to receive(:get).and_return(JSON.parse(file_fixture('character.json').read))
      end

      it 'should be return a mapped data' do
        result = subject.call

        expect(result).to be_kind_of Integer
        expect(result).to eq 1009268
      end
    end
  end
end

