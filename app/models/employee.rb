class Employee < ActiveRecord::Base
	enum state: {active: 0, employed: 1, interesting: 2}
	validates :name, :contacts, :state, :salary, presence: true
	validates :name, format: { with: /\A[А-Я][а-я]+ [А-Я][а-я]+ [А-Я][а-я]+\z/, message: "Необходимо ввести полное ФИО"}
    validates :contacts, format: { with: /(\A[\w.]+@[\w.]+\.\w+\z|\A[\d+]+\(\d+\)[\d-]+\z)/, message: "Необходимо ввести телефон \"код_страны(код_города)телефон\" или эл-почту \"email@example.com\""}
    validates :salary, numericality: { greater_than: 0 }

    has_and_belongs_to_many :skills
end
