require 'rails_helper'

feature 'Employee managment' do
  scenario 'User creates a new employee' do
    visit '/employees'
    save_and_open_page

    expect(page).to have_text('Работники')
    find_link('Добавить').click
    save_and_open_page
   
    expect(page).to have_text('Новый работник')
    employee_name = 'Иванов Иван Иваныч'
    employee_contacts = 'test@test.ru'
    employee_state = 'Трудоустроен'
    employee_salary = '100000'

    fill_in 'employee_name', :with => employee_name
    fill_in 'employee_contacts', :with => employee_contacts
    choose employee_state
    fill_in 'employee_salary', :with => employee_salary

    # добавить умения

    click_button 'Сохранить'
    save_and_open_page

    expect(page).to have_text('Работник создан')
    expect(page).to have_text(employee_name)
    expect(page).to have_text(employee_contacts)
    expect(page).to have_text(employee_state)
    expect(page).to have_text(employee_salary)

    # проверить добавленные умения

  end
end