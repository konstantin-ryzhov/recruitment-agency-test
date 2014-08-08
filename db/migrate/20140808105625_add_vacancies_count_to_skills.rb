class AddVacanciesCountToSkills < ActiveRecord::Migration
  def change
    add_column :skills, :vacancies_count, :integer, default: 0
  end
end
