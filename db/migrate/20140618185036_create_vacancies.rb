class CreateVacancies < ActiveRecord::Migration
  def change
    create_table :vacancies do |t|
      t.string :name
      t.datetime :created_at
      t.datetime :valid_until
      t.decimal :salary
      t.string :contacts
    end
  end
end
