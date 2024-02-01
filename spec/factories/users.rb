FactoryBot.define do
  factory :user do
    nickname { "JohnDoe" }
    email { Faker::Internet.email }
    password { "Abc123" }
    password_confirmation {password}
    last_name { "山田" } 
    first_name { "太郎" } 
    last_name_kana { "ヤマダ" } 
    first_name_kana { "タロウ" } 
    birthday { Date.today }
  end
end