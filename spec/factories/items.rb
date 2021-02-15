FactoryBot.define do
  factory :item do
    product                {'オムライス'}
    description            {'美味しいですよ'}
    price                  {999999}
    category_id            {2}
    state_id               {2}
    delivery_fee_burden_id {2}
    area_id                {2}
    day_id                 {2}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test-image.png'), filename: 'test_image.png')
    end
  end
end
