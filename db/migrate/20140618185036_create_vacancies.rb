class CreateVacancies < ActiveRecord::Migration
  def change
    create_table :vacancies do |t|
      t.string :name
      t.datetime :valid_until
      t.decimal :salary
      t.string :contacts
      t.datetime :created_at
    end
  end
end
