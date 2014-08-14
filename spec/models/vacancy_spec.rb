require 'rails_helper'

# Вакансия должна иметь:
#   Название
#   Дату добавления
#   Срок действия
#   Зарплату
#   Контактную информацию
#   Несколько требуемых умений

describe Vacancy do
  it 'is valid while created with factory' do
    vacancy = build(:vacancy)
    expect(vacancy).to be_valid
  end

  it 'is invalid without name' do
    vacancy = build(:vacancy, name: nil)
    expect(vacancy).to have(1).errors_on :name
  end

  it 'is invalid without valid_until' do
    vacancy = build(:vacancy, valid_until: nil)
    expect(vacancy).to_not be_valid
  end

  it 'is invalid with valid_until not a date' do
    vacancy = build(:vacancy, valid_until: 'not_a_date')
    expect(vacancy).to_not be_valid
  end

  it 'is invalid without a salary' do
    vacancy = build(:vacancy, salary: nil)
    expect(vacancy).to_not be_valid
  end

  it 'is invalid with a salary not a number' do
    vacancy = build(:vacancy, salary: 'not_a_number')
    expect(vacancy).to have(1).errors_on :salary
  end

  it 'is invalid with a salary less or equal to zero' do
    vacancy = build(:vacancy, salary: -0.1)
    expect(vacancy).to have(1).errors_on :salary
  end

  it 'is invalid without contacts' do
    vacancy = build(:vacancy, contacts: nil)
    expect(vacancy).to have(1).errors_on :contacts
  end
end

