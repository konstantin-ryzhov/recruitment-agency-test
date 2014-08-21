require 'rails_helper'

feature 'Vacancy managment' do
  scenario 'Show vacancy' do
    vacancy_skills = ['Ruby','Rails']
    vacancy = create :vacancy, skills_array: vacancy_skills
    visit vacancy_path(vacancy)

    expect(page).to have_text(vacancy.name)
    expect(page).to have_text(I18n.l vacancy.valid_until.to_date)
    expect(page).to have_text(vacancy.salary)
    expect(page).to have_text(vacancy.contacts)

    vacancy_skills.each do |s|
      expect(page).to have_text(s)
    end
  end

  scenario 'Remove vacancy' do
    vacancy = create :vacancy
    visit vacancy_path(vacancy)
    click_on 'Удалить'
    expect(page).to have_text('Вакансия удалена')
    expect(Vacancy.find_by_id vacancy.id).to be_nil
  end

  scenario 'Create a new vacancy' do
    visit '/vacancies'

    expect(page).to have_text('Вакансии')
    click_on 'Добавить'
   
    expect(page).to have_text('Новая вакансия')
    vacancy_name = 'test test test'
    valid_until = '01.11.2014'
    vacancy_salary = '100000'
    vacancy_contacts = 'test@test.ru'
    #умения для добавления

    fill_in 'vacancy_name', :with => vacancy_name
    fill_in 'valid_until', :with => valid_until
    fill_in 'vacancy_salary', :with => vacancy_salary
    fill_in 'vacancy_contacts', :with => vacancy_contacts
    # добавить умения

    click_on 'Сохранить'

    expect(page).to have_text('Вакансия создана')
    expect(page).to have_text(vacancy_name)
    expect(page).to have_text(valid_until)
    expect(page).to have_text(vacancy_salary)
    expect(page).to have_text(vacancy_contacts)
    # проверить добавленные умения
  end
end