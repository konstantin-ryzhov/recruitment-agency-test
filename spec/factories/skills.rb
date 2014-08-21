FactoryGirl.define do
  factory :skill do
    sequence(:name) { |n| "Skill_#{n}" }
    
    factory :skill_with_employees do
      association :employees
    end

    factory :skill_with_vacancies do
      association :vacancies
    end
  end
end