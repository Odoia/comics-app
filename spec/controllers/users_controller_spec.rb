require 'rails_helper'

describe ::UsersController, type: :controller do
  let(:current_user) { User.first }

  context 'When set a favorit comic' do
    before do
      User.new(login: 'user1', password: 'pws').save!
      allow(Comics::All).to receive(:get).and_return(JSON.parse(file_fixture('comics.json').read))
      allow(Current).to receive(:user).and_return(current_user)
    end

    it 'should be return an array with a favorites comic ids' do
      post 'update_favorite', params: { comic_id: '6' , favorite_value: 'false' }

      expect(response.status).to eq 204
      expect(current_user.favorite.count).to eq 1
    end
  end

  context 'When unset a favorit comic' do
    before do
      User.new(login: 'user1', password: 'pws', favorite: [1,4,6,9]).save!
      allow(Comics::All).to receive(:get).and_return(JSON.parse(file_fixture('comics.json').read))
      allow(Current).to receive(:user).and_return(current_user)
    end

    it 'should be return an array with 20 comics' do
      post 'update_favorite', params: { comic_id: '6', favorite_value: 'true' }

      favorite_array = current_user.favorite
      expect(response.status).to eq 204
      expect(favorite_array.count).to eq 3
      expect(favorite_array.include?(6)).to eq false
    end
  end
end
