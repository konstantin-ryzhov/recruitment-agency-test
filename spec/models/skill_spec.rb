require 'rails_helper'

describe Skill do
  before :each do
    employee_1 = create :employee, skills_array: ["skill_1","skill_2","skill_3"]
    employee_2 = create :employee, skills_array: ["skill_1","skill_2"]
    employee_3 = create :employee, skills_array: ["skill_1"]

    vacancy_1 = create :vacancy, valid_until: DateTime.now + 1, skills_array: ["skill_1","skill_2","skill_3"]
    vacancy_2 = create :vacancy, valid_until: DateTime.now + 1, skills_array: ["skill_1","skill_2"]
    vacancy_3 = create :vacancy, valid_until: DateTime.now + 1, skills_array: ["skill_1"]

    @employee_1 = Employee.find employee_1.id
    @employee_2 = Employee.find employee_2.id
    @employee_3 = Employee.find employee_3.id

    @vacancy_1 = Vacancy.find vacancy_1.id
    @vacancy_2 = Vacancy.find vacancy_2.id
    @vacancy_3 = Vacancy.find vacancy_3.id
  end

  context 'Finding of suitables' do
    it 'is suitable for employees' do
      expect(@employee_1.suitable).to match_array [@vacancy_1,@vacancy_2,@vacancy_3]
      expect(@employee_2.suitable).to match_array [@vacancy_2,@vacancy_3]
      expect(@employee_3.suitable).to match_array [@vacancy_3]
    end

    it 'is suitable for vacancies' do
      expect(@vacancy_1.suitable).to match_array [@employee_1]
      expect(@vacancy_2.suitable).to match_array [@employee_1,@employee_2]
      expect(@vacancy_3.suitable).to match_array [@employee_1,@employee_2,@employee_3]
    end
  end

  context 'Finding of partly suitables' do
    it 'is partly suitable for employees' do
      expect(@employee_2.partly_suitable).to match_array [@vacancy_1]
      expect(@employee_3.partly_suitable).to match_array [@vacancy_1,@vacancy_2]
    end

    it 'is partly suitable for vacancies' do
      expect(@vacancy_1.partly_suitable).to match_array [@employee_2,@employee_3]
      expect(@vacancy_2.partly_suitable).to match_array [@employee_3]
    end
  end

end