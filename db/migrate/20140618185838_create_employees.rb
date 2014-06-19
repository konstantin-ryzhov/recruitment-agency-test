class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.string :contacts
      t.integer :state
      t.decimal :salary
    end
  end
end
