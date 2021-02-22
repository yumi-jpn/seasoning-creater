require 'rails_helper'

RSpec.describe 'コメント投稿', type: :system do
  before do
    @taste = FactoryBot.create(:taste)
    @comment = Faker::Lorem.sentence
  end
  it 'ログインしたユーザーはテイスト詳細ページでコメント投稿できる' do
    # ログインする
    sign_in(@taste.user)
    # テイスト詳細ページに遷移する
    visit taste_path(@taste)
    # フォームに情報を入力する
    fill_in 'comment_comment', with: @comment
    # 画像選択フォームに画像を添付する
    attach_file 'comment_image', "#{Rails.root}/spec/factories/images/menus_sample.jpg"
    # コメントを送信すると、Commentモデルのカウントが1上がることを確認する
    expect do
      find('input[name="commit"]').click
    end.to change { Comment.count }.by(1)
    # 詳細ページにリダイレクトされることを確認する
    expect(current_path).to eq(taste_path(@taste))
    # 詳細ページ上に先ほどのコメント内容が含まれていることを確認する
    expect(page).to have_content @comment
    # 送信した画像がブラウザに表示されていることを確認する
    expect(page).to have_selector('img')
  end
end
