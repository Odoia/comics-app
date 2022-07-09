require 'rails_helper'

describe ::Comics::All  do

  context 'When get all comics' do
    context 'When pass a valid param' do
      before do
        allow(Comics::All).to receive(:get).and_return(JSON.parse(file_fixture("comics.json").read))
      end

      it 'should be return status 200' do
        response = subject.call

        result= response['data']['results'].first
        expect(result['id']).to be_kind_of Integer
      end
    end
  end
end

