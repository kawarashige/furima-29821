FactoryBot.define do
  factory :order_address do
    token          { 'tok_949c0029d77a30a7b46380ce68ec' }
    postal_code    { '123-4567' }
    prefecture_id  { 1 }
    city           { 'ABC' }
    addresses      { 'DEF' }
    building_name  { 'GHI' }
    phone_number   { '0901234567' }
  end
end
