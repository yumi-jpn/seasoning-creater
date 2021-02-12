require 'rails_helper'

RSpec.describe Taste, type: :model do
  describe '#create' do
    before do
      @taste = FactoryBot.build(:taste)
    end

    describe 'テイスト新規登録' do
      context '新規登録ができるとき' do
        it 'image、title、example、genre_id、recipeがあれば登録できる' do
          expect(@taste).to be_valid
        end
      end
      context 'テイスト新規登録ができないとき' do
        it 'imageが空では登録できない' do
          @taste.image = nil
          @taste.valid?
          expect(@taste.errors.full_messages).to include("Image can't be blank")
        end
        it 'titleが空では登録できない' do
          @taste.title = nil
          @taste.valid?
          expect(@taste.errors.full_messages).to include("Title can't be blank")
        end
        it 'exampleが空では登録できない' do
          @taste.example = nil
          @taste.valid?
          expect(@taste.errors.full_messages).to include("Example can't be blank")
        end
        it 'recipeが空では登録できない' do
          @taste.recipe = nil
          @taste.valid?
          expect(@taste.errors.full_messages).to include("Recipe can't be blank")
        end
        it 'genre_idの選択が1では登録できない' do
          @taste.genre_id = 1
          @taste.valid?
          expect(@taste.errors.full_messages).to include("Genre must be other than 1")
        end
      end
    end
  end
end
