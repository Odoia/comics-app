require 'rails_helper'

describe ::ComicsController, type: :controller do

  context 'When controller is accessed' do
    before do
      allow(Comics::All).to receive(:get).and_return(JSON.parse(file_fixture("comics.json").read))
    end

    it 'should be return an 200 status' do
      result = subject.index

      expect(response.status).to eq 200
      expect(result['code']).to eq 200
    end
  end
end
