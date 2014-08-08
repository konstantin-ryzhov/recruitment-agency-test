class AddEmployeesCountToSkills < ActiveRecord::Migration
  def change
    add_column :skills, :employees_count, :integer, default: 0
  end
end
