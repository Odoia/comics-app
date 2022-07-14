require 'rails_helper'

describe ::ComicsController, type: :controller do
  let(:user) { User.new(login: 'user1', password: 'pws') }
  let(:current_user) { Current.user = user }

  context 'When controller is accessed' do
    before do
      current_user
      allow(Comics::All).to receive(:get).and_return(JSON.parse(file_fixture('comics.json').read))
    end

    # TODO: improve a render test 
    it 'should be return an array with 20 comics' do
      result = subject.index

      expect(response.status).to eq 200
      expect(result).to be_kind_of Array
      expect(result.count).to eq 20
    end
  end
end
