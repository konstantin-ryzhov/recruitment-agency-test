require 'rails_helper'

feature 'Employee managment' do

  scenario 'Show employee' do
    employee_skills = ['Ruby','Rails']
    employee = create :employee, skills_array: employee_skills
    visit employee_path(employee)

    expect(page).to have_text(employee.name)
    expect(page).to have_text(employee.contacts)
    expect(page).to have_text(I18n.t employee.state)
    expect(page).to have_text(employee.salary)

    employee_skills.each do |s|
      expect(page).to have_text(s)
    end
  end

  scenario 'Remove employee' do
    employee = create :employee
    visit employee_path(employee)
    click_on 'Удалить'
    expect(page).to have_text('Работник удален')
    expect(Employee.find_by_id employee.id).to be_nil
  end

  scenario 'Create a new employee' do
    visit '/employees'

    expect(page).to have_text('Работники')
    click_on 'Добавить'
   
    expect(page).to have_text('Новый работник')
    employee_name = 'Иванов Иван Иваныч'
    employee_contacts = 'test@test.ru'
    employee_state = 'Трудоустроен'
    employee_salary = '100000'
    #умения для добавления
    # employee_skills = ['Ruby','Rails']

    fill_in 'employee_name', :with => employee_name
    fill_in 'employee_contacts', :with => employee_contacts
    choose employee_state
    fill_in 'employee_salary', :with => employee_salary
    # добавить умения
    # fill_in 'employee[skills_array]', :with => employee_skills

    click_on 'Сохранить'

    expect(page).to have_text('Работник создан')
    expect(page).to have_text(employee_name)
    expect(page).to have_text(employee_contacts)
    expect(page).to have_text(employee_state)
    expect(page).to have_text(employee_salary)
    # проверить добавленные умения
    # employee_skills.each do |s|
    #   expect(page).to have_text(s)
    # end
  end
end