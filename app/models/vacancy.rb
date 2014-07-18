class Vacancy < ActiveRecord::Base
  include Skillable
  
  validates :name, :valid_until, :salary, :contacts, presence: true
  validates :salary, numericality: { greater_than: 0 }
  validates :valid_until, date: true

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

    employees = Employee
      .includes(:skills)
      .joins(skills:[:vacancies])
      .where(vacancies:{id: id},)
      .distinct
      .order(salary: :asc)

    employees.each do |e|
      if skills - e.skills == []
        @_suitable.push e 
      else
        @_partly_suitable.push e
      end
    end
  end
end
