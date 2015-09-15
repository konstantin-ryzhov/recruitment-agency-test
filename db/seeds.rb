Skill.delete_all
Employee.delete_all
Vacancy.delete_all

Employee.create!(name: 'Горбунов Андрей Вениаминович', contacts: 'agorbunov@gmail.com', state: :active, salary: 100000, skills_array: ['Ruby','Rails','SQL'] )
Employee.create!(name: 'Земская Ирина Алексеевна', contacts: '+7(499)448-34-23', state: :active, salary: 85000, skills_array: ['Ruby','Rails','JavaScript'] )
Employee.create!(name: 'Сыроежкина Алиса Николаевна', contacts: 'asyroejkina@mail.ru', state: :active, salary: 80000, skills_array: ['C++','C'] )
Employee.create!(name: 'Иванов Александр Андреевич', contacts: '8(495)100-45-64', state: :active, salary: 110000, skills_array: ['C#','Visual Basic','SQL'] )
Employee.create!(name: 'Николаев Антон Владимирович', contacts: 'anikolaev@rambler.ru', state: :active, salary: 115000, skills_array: ['NodeJS','SQL'] )
Employee.create!(name: 'Бадоева Жанна Андреевна', contacts: 'jbadoeva@gmail.com', state: :active, salary: 130000, skills_array: ['JavaScript','Adobe_CS6'] )
Employee.create!(name: 'Романов Иван Григорьевич', contacts: 'iromanov@mail.ru', state: :active, salary: 150000, skills_array: ['Java','C','SQL'] )
Employee.create!(name: 'Каширин Герасим Семенович', contacts: 'gkashirin@gmail.com', state: :employed, salary: 120000, skills_array: ['Ruby','C++','C#','JavaScript'] )
Employee.create!(name: 'Ильин Семен Александрович', contacts: 'silin@gmail.com', state: :interesting, salary: 90000, skills_array: ['Ruby','SQL'] )

Vacancy.create!(
	name: 'Backend Ruby разработчик',
	salary: 120000, 
	valid_until: Date.today + 15, 
	contacts: '8(800)2000499', 
	skills_array: ['Ruby','Rails','SQL'] )
Vacancy.create!(
	name: 'Frontend Ruby разработчик', 
	salary: 110000, 
	valid_until: Date.today + 15, 
	contacts: '8(495)2000499', 
	skills_array: ['Ruby','Rails','JavaScript'] )
Vacancy.create!(
	name: 'C++ разработчик', 
	salary: 90000, 
	valid_until: Date.today - 15, 
	contacts: '8(499)7780478', 
	skills_array: ['C++','C'] )
Vacancy.create!(
	name: '.NET разработчик', 
	salary: 80000, 
	valid_until: Date.today + 30, 
	contacts: '8(459)2045699', 
	skills_array: ['C#','Visual Basic','SQL'] )
Vacancy.create!(
	name: 'Backend разработчик', 
	salary: 115000, 
	valid_until: Date.today + 90, 
	contacts: '8(800)2000456', 
	skills_array: ['NodeJS','SQL'] )
Vacancy.create!(
	name: 'Frontend разработчик', 
	salary: 130000, 
	valid_until: Date.today + 15, 
	contacts: '8(499)1440423', 
	skills_array: ['JavaScript','Adobe_CS6'] )
Vacancy.create!(
	name: 'Художник-дизайнер', 
	salary: 180000, 
	valid_until: Date.today + 15, 
	contacts: '8(499)3450447', 
	skills_array: ['Adobe_CS6','JavaScript'] )
Vacancy.create!(
	name: 'Руководитель проектов', 
	salary: 200000, 
	valid_until: Date.today + 15, 
	contacts: '8(495)5670765', 
	skills_array: ['Ruby','C++','C#','JavaScript'] )
Vacancy.create!(
	name: 'Java разработчик', 
	salary: 110000, 
	valid_until: Date.today + 15, 
	contacts: '8(800)2230499', 
	skills_array: ['Java','C','SQL'] )