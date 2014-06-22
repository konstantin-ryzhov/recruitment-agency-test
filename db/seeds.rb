# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Skill.delete_all
Employee.delete_all
Vacancy.delete_all

Ruby = Skill.create(name: 'Ruby')
RailsSkill = Skill.create(name: 'Rails')
Cpp = Skill.create(name: 'C++')
CSharp = Skill.create(name: 'C#')
VB = Skill.create(name: 'Visual Basic')
NodeJS = Skill.create(name: 'NodeJS')
SQL = Skill.create(name: 'SQL')
Java = Skill.create(name: 'Java')
JavaScript = Skill.create(name: 'JavaScript')
C = Skill.create(name: 'C')
Adobe_CS6 = Skill.create(name: 'Adobe CS6')

Employee.create!(name: 'Горбунов Андрей Вениаминович', contacts: 'agorbunov@gmail.com', state: :active, salary: 100000).skills << [Ruby,RailsSkill,SQL]
Employee.create!(name: 'Земская Ирина Алексеевна', contacts: '+7(499)448-34-23', state: :active, salary: 85000).skills << [Ruby,RailsSkill,JavaScript]
Employee.create!(name: 'Сыроежкина Алиса Николаевна', contacts: 'asyroejkina@mail.ru', state: :active, salary: 80000).skills << [Cpp,C]
Employee.create!(name: 'Иванов Александр Андреевич', contacts: '8(495)100-45-64', state: :active, salary: 110000).skills << [CSharp,VB,SQL]
Employee.create!(name: 'Николаев Антон Владимирович', contacts: 'anikolaev@rambler.ru', state: :active, salary: 115000).skills << [NodeJS,SQL]
Employee.create!(name: 'Бадоева Жанна Андреевна', contacts: 'jbadoeva@gmail.com', state: :active, salary: 130000).skills << [JavaScript,Adobe_CS6]
Employee.create!(name: 'Романов Иван Григорьевич', contacts: 'iromanov@mail.ru', state: :active, salary: 150000).skills << [Java,C,SQL]
Employee.create!(name: 'Каширин Герасим Семенович', contacts: 'gkashirin@gmail.com', state: :employed, salary: 120000).skills << [Ruby,Cpp,CSharp,JavaScript]
Employee.create!(name: 'Ильин Семен Александрович', contacts: 'silin@gmail.com', state: :interesting, salary: 90000).skills << [Ruby,SQL]

Vacancy.create!(name: 'Backend Ruby разработчик', salary: 120000, valid_until: DateTime.new(2014,10,11), contacts: '8(800)2000499').skills << [Ruby,RailsSkill,SQL]
Vacancy.create!(name: 'Frontend Ruby разработчик', salary: 110000, valid_until: DateTime.new(2014,9,11), contacts: '8(495)2000499').skills << [Ruby,RailsSkill,JavaScript]
Vacancy.create!(name: 'C++ разработчик', salary: 90000, valid_until: DateTime.new(2014,8,15), contacts: '8(499)7780478').skills << [Cpp,C]
Vacancy.create!(name: '.NET разработчик', salary: 80000, valid_until: DateTime.new(2014,10,1), contacts: '8(459)2045699').skills << [CSharp,VB,SQL]
Vacancy.create!(name: 'Backend разработчик', salary: 115000, valid_until: DateTime.new(2014,12,5), contacts: '8(800)2000456').skills << [NodeJS,SQL]
Vacancy.create!(name: 'Frontend разработчик', salary: 130000, valid_until: DateTime.new(2014,12,6), contacts: '8(499)1440423').skills << [JavaScript,Adobe_CS6]
Vacancy.create!(name: 'Художник-дизайнер', salary: 180000, valid_until: DateTime.new(2014,11,1), contacts: '8(499)3450447').skills << [Adobe_CS6,JavaScript]
Vacancy.create!(name: 'Руководитель проектов', salary: 200000, valid_until: DateTime.new(2014,6,30), contacts: '8(495)5670765').skills << [Ruby,Cpp,CSharp,JavaScript]
Vacancy.create!(name: 'Java разработчик', salary: 110000, valid_until: DateTime.new(2014,7,30), contacts: '8(800)2230499').skills << [Java,C,SQL]