require 'faker'

FactoryGirl.define do
  factory :vacancy do |f|
    f.name         { Faker::Lorem.sentence(2) }
    f.valid_until  { Faker::Business.credit_card_expiry_date }
    f.salary       { Faker::Number.number(6) }
    f.contacts     { Faker::Internet.email }
    f.skills_array { Faker::Lorem.words(3) }
  end
end