class Vacancy < ActiveRecord::Base
  include Skillable
  
  validates :name, :valid_until, :salary, :contacts, presence: true
  validates :salary, numericality: { greater_than: 0 }
  validates :valid_until, date: true
end
