class Employee < ActiveRecord::Base
  include Skillable

  enum state: {active: 0, employed: 1, interesting: 2}
  
  validates :name, :contacts, :state, :salary, presence: true
  validates :name, format: { with: /\A[А-Я][а-я]+ [А-Я][а-я]+ [А-Я][а-я]+\z/, message: "^Необходимо ввести полное ФИО"}
  validates :contacts, format: { with: /(\A[\w.]+@[\w.]+\.\w+\z|\A[\d+]+\(\d+\)[\d-]+\z)/, message: "^Необходимо ввести телефон \"код_страны(код_города)телефон\" или эл-почту \"email@example.com\""}
  validates :salary, numericality: { greater_than: 0 }

  def suitable
    refresh_suitable unless @_suitable
    return @_suitable
  end

  def partly_suitable
    refresh_suitable unless @_partly_suitable
    return @_partly_suitable
  end

private
  def refresh_suitable
    @_suitable = Array.new
    @_partly_suitable = Array.new

    vacancies = Vacancy
      .includes(:skills)
      .joins(skills:[:employees])
      .where(employees:{id: id},)
      .where("valid_until > ?",DateTime.now)
      .distinct
      .order(salary: :desc)

    vacancies.each do |v|
      if v.skills - skills == []
        @_suitable.push v 
      else
        @_partly_suitable.push v
      end
    end
  end
end
