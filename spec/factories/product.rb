FactoryBot.define do
  factory :product do
    name                 {"foy"}
    price                {"1000"}
    detail               {"これはfoyです"}
    user_id              {"1"}
    condition_id         {"1"}
    shipping_fee_id      {"1"}
    shipping_method_id   {"1"}
    prefecture_id        {"1"}
    deliveryday_id       {"1"}
    category_id          {"1"}
    status               {:exhibit}
  end
end