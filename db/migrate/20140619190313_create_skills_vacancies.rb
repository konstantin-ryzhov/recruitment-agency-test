class CreateSkillsVacancies < ActiveRecord::Migration
  def change
    create_table :skills_vacancies do |t|
		t.integer :vacancy_id
		t.integer :skill_id
    end
  end
end
