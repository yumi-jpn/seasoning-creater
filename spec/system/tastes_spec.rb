require 'rails_helper'

RSpec.describe "テイスト投稿", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @taste_title = Faker::Lorem.sentence
    @taste_example = Faker::Lorem.sentence
    @taste_recipe = Faker::Lorem.sentence
  end
  context 'テイスト投稿ができるとき'do
    it 'ログインしたユーザーは新規投稿できる' do
      # ログインする
      visit new_user_session_path
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      find('input[name="commit"]').click
      expect(current_path).to eq(root_path)
      # 新規投稿ページへのリンクがあることを確認する
      expect(page).to have_content('投稿する')
      # 投稿ページに移動する
      visit new_taste_path
      # フォームに情報を入力する
      attach_file 'taste_image', "#{Rails.root}/spec/factories/images/menus_sample.jpg"
      # 画像選択フォームに画像を添付する
      fill_in 'taste_title', with: @taste_title
      select '揚げ物'
      fill_in 'taste_example', with: @taste_example
      fill_in 'taste_recipe', with: @taste_recipe
      # 送信した値がDBに保存されていることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Taste.count }.by(1)
      # トップページに遷移する
      expect(current_path).to eq(root_path)
      # トップページには先ほど投稿した内容のテイストが存在することを確認する（画像）
      expect(page).to have_selector('img')
      # トップページには先ほど投稿した内容のテイストが存在することを確認する（テイスト名）
      expect(page).to have_content(@taste_title)
      # トップページには先ほど投稿した内容のテイストが存在することを確認する（ジャンル名）
      expect(page).to have_content(@taste_genre_id)
    end
  end
  context 'テイスト投稿ができないとき'do
    it 'ログインしていないと新規投稿ページに遷移できない' do
      # トップページに遷移する
      visit root_path
      # ログインしていないとログインページに遷移する
      visit new_user_session_path
    end
  end
end
