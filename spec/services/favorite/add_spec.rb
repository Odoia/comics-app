require 'rails_helper'

describe ::Favorite::Add  do
  subject { ::Favorite::Add.new(comic_id: '82967') }
  let(:current_user) { User.first }

  context 'When add a comic as favorite' do
    context 'When pass a valid param' do
      before do
        User.new(login: 'user1', password: 'pws').save!
        allow(Comics::All).to receive(:get).and_return(JSON.parse(file_fixture('comics.json').read))
        allow(Current).to receive(:user).and_return(current_user)
      end

      it 'should be return a array with a comic param id' do
        subject.call

        expect(current_user.favorite).to be_kind_of Array
        expect(current_user.favorite.include?(82967)).to be true
      end
    end
  end
end
