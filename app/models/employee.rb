class Employee < ActiveRecord::Base
	enum state: [:active, :employed, :interesting]
end
