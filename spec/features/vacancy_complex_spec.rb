require 'rails_helper'

feature 'Vacancy managment' do
  scenario 'User creates a new vacancy' do
    visit '/vacancies'
    save_and_open_page

    expect(page).to have_text('Вакансии')
    find_link('Добавить').click
    save_and_open_page
   
    expect(page).to have_text('Новая вакансия')
    vacancy_name = 'test test test'
    valid_until = '01.11.2014'
    vacancy_salary = '100000'
    vacancy_contacts = 'test@test.ru'

    fill_in 'vacancy_name', :with => vacancy_name
    fill_in 'valid_until', :with => valid_until
    fill_in 'vacancy_salary', :with => vacancy_salary
    fill_in 'vacancy_contacts', :with => vacancy_contacts

    # добавить умения

    click_button 'Сохранить'
    save_and_open_page

    expect(page).to have_text('Вакансия создана')
    expect(page).to have_text(vacancy_name)
    expect(page).to have_text(valid_until)
    expect(page).to have_text(vacancy_salary)
    expect(page).to have_text(vacancy_contacts)

    # проверить добавленные умения

  end
end