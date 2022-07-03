['erick','juan', 'andrea', 'leon', 'andres', 'natalia', 'camilo', 'rusbel', 'johan'].each do |name|

  User.create email: "#{name}@gmail.com", password: '123456'
end

puts 'Users has been created'

['desarrollo', 'mercadeo', 'conceptualización', 'ejercicios'].each do |name|

  Category.create name: name, description: '--'

end

puts 'Categories has been created'

owner = User.find_by(email: 'erick@gmail.com')

base = [
  [
    'conceptualización',
    'Bienvenida ',
    ['johan:1', 'leon:2', 'andrea:random']
  ],
  [
    'conceptualización',
    '¿Qué es ruby on rails y por qué usarlo?',
    ['johan:1', 'leon:2', 'andrea:random']
  ],
  [
    'conceptualización',
    'Entorno de desarrollo de RoR',
    ['johan:1', 'leon:2', 'andrea:random']
  ],
  [
    'ejercicios',
    'Instalación de Ruby, RoR en windows y Linux',
    ['johan:1', 'leon:2', 'andrea:random']
  ],
]

base.each do |category, description, participant_set|
  participants = participant_set.map do |participant|
    user_name, raw_role = participant.split(':')
    role = raw_role == 'random' ? [1, 2].sample : raw_role
    Participant.new(
      user: User.find_by(email: "#{user_name}@gmail.com"),
      role: role.to_i
    )
  end

  Task.create!(
    category: Category.find_by(name: category),
    name: "Tarea ##{Task.count + 1}",
    description: description,
    due_date: Date.today + 15.days,
    owner: owner,
    participating_users: participants
  )
end

puts 'Tasks has been created'