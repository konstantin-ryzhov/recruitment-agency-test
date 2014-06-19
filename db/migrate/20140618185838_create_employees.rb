class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.string :contacts
      t.column :state, :integer, default: 0
      t.decimal :salary
    end
  end
end
