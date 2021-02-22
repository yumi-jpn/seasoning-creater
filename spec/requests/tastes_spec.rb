require 'rails_helper'
describe TastesController, type: :request do
  before do
    @taste = FactoryBot.create(:taste)
  end

  describe 'taste #index' do
    it 'indexアクションにリクエストすると正常にレスポンスが返ってくる' do
      get root_path
      expect(response.status).to eq 200
    end
    it 'indexアクションにリクエストするとレスポンスに投稿済みのテイストのtitleが存在する' do
      get root_path
      expect(response.body).to include(@taste.title)
    end
    it 'indexアクションにリクエストするとレスポンスに投稿済みのテイストのgenre_nameが存在する' do
      get root_path
      expect(response.body).to include(@taste.genre.name)
    end

    describe 'taste #show' do
      it 'showアクションにリクエストすると正常にレスポンスが返ってくる' do
        get taste_path(@taste)
        expect(response.status).to eq 200
      end
      it 'showアクションにリクエストするとレスポンスに投稿済みのテイストのtitleが存在する' do
        get taste_path(@taste)
        expect(response.body).to include(@taste.title)
      end
      it 'showアクションにリクエストするとレスポンスに投稿済みのテイストのgenre_nameが存在する' do
        get taste_path(@taste)
        expect(response.body).to include(@taste.genre.name)
      end
    end
  end
end
