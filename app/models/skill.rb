class Skill < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  has_and_belongs_to_many :employees#, counter_cache: true
  has_and_belongs_to_many :vacancies#, counter_cache: true

  def reset_counters
    self.vacancies_count = vacancies.count
    self.employees_count = employees.count
    self.save
  end
end
