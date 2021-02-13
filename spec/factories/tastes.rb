FactoryBot.define do
  factory :taste do
    title              { 'チヂミ用・激辛ダレ' }
    example            { '海鮮チヂミ、ニラ玉チヂミなど' }
    genre_id           { Faker::Number.between(from: 2, to: 6) }
    recipe             { '1, 全種類を混ぜ、沸騰したら完成！' }
    association :user # アソシエーション

    after(:build) do |item|
      item.image.attach(io: File.open('public/menus_sample.jpg'), filename: 'menus_sample.jpg')
    end
  end
end
