class Skill < ActiveRecord::Base
	validates :name, presence: true, uniqueness: true

	has_and_belongs_to_many :employees
	has_and_belongs_to_many :vacancies
end
