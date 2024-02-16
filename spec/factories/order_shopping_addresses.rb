FactoryBot.define do
  factory :order_shopping_address do
    token { 'tok_abcdefghijk00000000000000000' }
    postal_code { '123-4567' }
    origin_region_id { '2' }
    municipality { '東京' }
    street_address { '青山1-2-3' }
    building_name { 'ビルビル12' }
    phone_number { '09012345678' }
  end
end
