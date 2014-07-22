require 'rails_helper'

RSpec.describe Vacancy, :type => :model do

  it 'have valid factory' do
    vacancy = build(:vacancy)
    expect(vacancy).to be_valid
  end

  # Вакансия должна иметь:
  #   Название
  #   Дату добавления
  #   Срок действия
  #   Зарплату
  #   Контактную информацию
  #   Несколько требуемых умений

  it 'invalid without name' do
    vacancy = build(:vacancy, name: nil)
    expect(vacancy).not_to be_valid
  end

  it 'invalid without created_at' do
    vacancy = build(:vacancy, created_at: nil)
    expect(vacancy).not_to be_valid
  end

  it 'invalid without valid_until' do
    vacancy = build(:vacancy, valid_until: nil)
    expect(vacancy).not_to be_valid
  end

  it 'invalid without salary' do
    vacancy = build(:vacancy, salary: nil)
    expect(vacancy).not_to be_valid
  end

  it 'invalid without contacts' do
    vacancy = build(:vacancy, contacts: nil)
    expect(vacancy).not_to be_valid
  end

  it 'invalid without skills_array' do
    vacancy = build(:vacancy, skills_array: nil)
    expect(vacancy).not_to be_valid
  end


end
