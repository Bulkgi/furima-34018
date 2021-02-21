FactoryBot.define do
  factory :order_address do
    postal_code  {"123-4567"}
    phone        {"1234567890"}
    area_id      {2}
    municipality {"青山1-1-1"}
    address      {"横浜市港区"}
    building     {"ホームルーム武田123"}
    token        {"tok_abcdefghijk00000000000000000"}
  end
end
