require 'rails_helper'

# Работник должен иметь:
#   Имя, оно должно содержать 3 слова и только кириллические буквы и пробелы
#   Контактную информацию и она должна содержать номер телефона или адрес эл-почты
#   Статус поиска работы
#   Желаемую зарплату
#   Несколько умений

describe Employee do
  it 'is valid while created with factory' do
    employee = build(:employee)
    expect(employee).to be_valid
  end

  it 'is invalid without 3 words' do
    name = 'Иванов Иван'
    employee = build(:employee, name: name)
    expect(employee).to have(1).errors_on :name
   end

  it 'is invalid without cyrilic letters' do
    name = 'Ivanov Ivan Ivanovich'
    employee = build(:employee, name: name)
    expect(employee).to have(1).errors_on :name
  end

  it 'is invalid without contacts' do
    employee = build(:employee, contacts: nil)
    expect(employee).to_not be_valid
  end

  it 'is invalid with contacts not as email or phone' do
    employee = build(:employee, contacts: 'invalid contacts')
    expect(employee).to have(1).errors_on :contacts
  end

  it 'is invalid without state' do
    employee = build(:employee, state: nil)
    expect(employee).to have(1).errors_on :state
  end

  it 'is invalid without salary' do
    employee = build(:employee, salary: nil)
    expect(employee).to_not be_valid
  end

  it 'is invalid with salary not a number' do
    employee = build(:employee, salary: 'not_a_number')
    expect(employee).to have(1).errors_on :salary
  end

  it 'is invalid with a salary less or equal to zero' do
    employee = build(:employee, salary: -0.1)
    expect(employee).to have(1).errors_on :salary
  end
end