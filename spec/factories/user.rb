FactoryBot.define do
  factory :user do
    nickname              {"foy"}
    email                 {"foy@gmail.com"}
    password              {"12345678"}
    password_confirmation {"12345678"}
    last_name             {"大輝"}
    first_name            {"松本"}
    last_name_kana        {"ダイキ"}
    first_name_kana       {"マツモト"}
    phone_number          {"1234567890"}
    postal_code           {"2720021"}
    prefecture            {"千葉県"}
    city                  {"市川市八幡"}
    house_number          {"1-2-3"}
    building_name         {"123"}
  end
end