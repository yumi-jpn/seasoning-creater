# 目的
自炊をしながらもいつも同じ味に片寄ってしまう。レパートリーを増やしたいというかたに向けたアプリです。

## 使い方
完成次第記述。

## こだわったポイント
完成次第記述。

## 使用言語
- Ruby
- Java script

## フレームワーク
- Ruby on rails
- Jquery


# テーブル設計

## usersテーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |

### Association
- has_many :tastes
- has_many :comments

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

## commentsテーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| comment  | string     |                                |
| user     | references | null: false, foreign_key: true |
| taste    | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :taste

## taste_seasoningsテーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| seasoning_name | string     | null: false                    |
| quantity       | string     | null: false                    |
| taste          | references | null: false, foreign_key: true |

### Association
- belongs_to :taste

