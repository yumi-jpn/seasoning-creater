# Seasoning-Creater  -味付けシェアサイト-
URLはこちらになります！
http://35.72.196.190/


また、Basic認証を使用しています。お手数ですが、こちらのユーザーネームとパスワードをご入力ください。

- ユーザーネーム: matsu

- パスワード:     123123abc


ログイン時に使用するテストユーザーをご用意しました。よろしければご使用ください。

※ サイトの閲覧のみであれば、ログインは必須ではございません。

- email: test@123
- password: 123123abc


# アプリケーションの概要
料理の味付けを調理種類別（煮込み料理や揚げ物等）に分けてチョイスすることができます。
「料理がいつも同じ味に片寄ってしまう」という悩みを改善するために製作したアプリケーションです。


***
## 使用言語
- Ruby 2.6.5
- JavaScript

## フレームワーク
- Ruby on Rails 6.0.0
- jQuery 3.4.1

## 開発環境
- インフラ :AWS(S3,EC2)
- データベース :MySQL 14.14
- セッション管理 :devise(Gem)
- 画像アップのライブラリ :Active Storage(Gem)

***

## 使い方
![output](https://user-images.githubusercontent.com/76472441/108425388-bd756d00-727d-11eb-85e2-e2aa5fa81745.gif)


### 共通事項
1. サイトのトップページにて、調理法の種類(煮込み料理や揚げ物など)を選択します。

   ※サイト下部に全てのレシピも掲載しております。
3. 味付けレシピが投稿されているので選択し、レシピを閲覧し、料理を作ります。
4. 再度に表示されているコメント機能では、他ユーザーが、「どのような料理を作ったのか、どのような食材を使用したら美味しくできたのか」を閲覧することができます。(コメントを投稿したい場合は、ログインが必須となります。)

### 味付けを投稿する場合
ユーザー自身が好みの味付けを投稿することもできます。
1. 投稿者はログインが必須となります。トップページ右下に表示されている、"投稿する"のボタンを押すことで投稿画面が開きます。
2. テイスト名、実物写真（作成した料理写真でも可）、調理法、作り方、材料名等の記述ができます。
3. もし編集、削除をしたい場合は、投稿したレシピを開くことで実行できます。


## こだわったポイント
- こだわった点は、視覚的に理解しやすいサイトに仕上げることです。日常生活において、忙しい中料理をしている方は多くいらっしゃいます。そのため、複雑な構造で気力や時間を失わずに調べられることを意識しました。
  
  ### 具体例
 1. Swiperを使用して30秒以内に、アプリケーションの使用方法を表示する。				
　　
 2. 味付けを決める作業工程を極限まで減らすため、調理種類別にページ遷移する。				
　
 3. 味付けがパターン化しやすい調理種類を調査し、分岐のベースにする。				



## 目指した課題解決
味付けのバリエーションを増やすには、個人の発信では限られてしまい、負荷もかかってしまいます。そこで、ユーザー全体でサービスを構築し、分散化するシステムを目指しました。



## 洗い出した要件
### 機能要件
 1. ユーザー管理機能 ・・・　新規登録、ログイン、ログアウト
　　
 2. 味付けレシピの投稿機能　・・・　味付けレシピの投稿、編集、削除
　
 3. 味付けレシピのジャンル分け機能　・・・　味付けレシピのジャンル(調理種類別)に分岐し閲覧　
　
 4. 味付けレシピの一覧、詳細表示機能　・・・　味付けレシピの調理法確認、閲覧
　
 5. 味付けレシピごとのコメント機能　・・・　コメント投稿
 
 6.　トップページのいいね機能 ・・・　味付けごとのいいね機能
 
 7.　マイページ閲覧機能 ・・・　ユーザーごとのマイページ機能



## 実装予定の機能

~いいね機能の導入~
~マイページの実装~

***


# テーブル設計

## usersテーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |

### Association
- has_many :taste
- has_many :comments
- has_many :likes

## tasteテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| title           | string     | null: false                    |
| example         | string     | null: false                    |
| recipe          | text       | null: false                    |
| genre_id        | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |
| taste_seasoning | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :taste_seasoning
- has_many :comments
- has_many :likes

## commentsテーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| comment  | string     |                                |
| user     | references | null: false, foreign_key: true |
| taste    | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :taste

## taste_seasoningテーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| seasoning_name | string     | null: false                    |
| quantity       | string     | null: false                    |
| taste          | references | null: false, foreign_key: true |

### Association
- belongs_to :taste


## likesテーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user_id    | integer    | null: false, foreign_key: true |
| taste_id   | integer    | null: false, foreign_key: true |


### Association
- belongs_to :user
- belongs_to :taste
