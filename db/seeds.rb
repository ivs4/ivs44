if (u1 = User.find_by_email('admin@localhost')).nil?
  u1 = User.create!(password: 'qwerty', password_confirmation: 'qwerty',
    email: 'admin@localhost')
  u1.activate!
end
if (u2 = User.find_by_email('user@localhost')).nil?
  u2 = User.create!(password: 'qwerty', password_confirmation: 'qwerty',
    email: 'user@localhost')
  u2.activate!
end
r1, r2 = Role.create_main_roles
ru1 = RoleUser.create(role: r1, user: u1)
ru2 = RoleUser.create(role: r2, user: u2)


#------------>Отдел
a1 = Department.create!(name: 'Отдел №1')


#------------>Проекты

b1 = Project.create!(name: 'Проект №1', price: '20000.55', start_date: '20.05.2017' , finish_date: '27.05.2017')


#----------->Сотрудники
h1 = Worker.create!(ln: 'Воронин', fn: 'Алексей', sn: 'Владимирович', pas_number: '565785', pas_serial: '6985', birthday: '29.06.1989', post: 'Заведующий кардиологией', inn: '478400000474', department_id: a1.id) 



#----------->Проект:сотрудник
m1 = WorkerProject.create!(worker_id: h1.id, project_id: b1.id)

