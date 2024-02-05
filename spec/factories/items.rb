FactoryBot.define do
  factory :item do
    item_name { '商品AAA' }
    description { '使いやすい商品です。' }
    price { 1000 } # 任意の価格を指定
    category_id { 4 }
    condition_id { 5 }
    shopping_fee_burden_id { 2 }
    origin_region_id { 8 }
    days_to_ship_id { 3 }
    association :user # ユーザーとの関連付け（適切な関連名に変更する）

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
