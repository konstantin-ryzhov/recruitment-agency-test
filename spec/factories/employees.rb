require 'faker'

FactoryGirl.define do
  factory :employee do |f|
    f.name         { 'Иванов Иван Иванович' }
    f.contacts     { 'ivanov@ya.ru' }
    f.state        { :active }
    f.salary       { Faker::Number.number(6) }
    f.skills_array { ['Ruby','Rails','SQL'] }
  end
end