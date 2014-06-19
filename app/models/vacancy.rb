class Vacancy < ActiveRecord::Base
	validates :name, :valid_until, :salary, :contacts, presence: true
	validates :salary, numericality: { greater_than: 0 }
	
	has_and_belongs_to_many :skills
end
