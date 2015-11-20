# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Destroy all
User.destroy_all
Couch.destroy_all
Type.destroy_all

# Tipos de couch
default	= Type.find_or_create_by(name: 'default')
cama	= Type.find_or_create_by(name: 'Cama')
sillon	= Type.find_or_create_by(name: 'Sillon')
hamaca	= Type.find_or_create_by(name: 'Hamaca')

# Usuarios
# Como le agrego el campo encrypted_password: ??
admin1	= User.find_or_create_by(name: 'admin1', lastName: 'Pereza1', email: 'admin1@mail.com', password: '12345', admin: true, premium: false, age: Date.current.change(year: Date.current.year-20))
admin2	= User.find_or_create_by(name: 'admin2', lastName: 'Pereza1', email: 'admin2@mail.com', password: '12345', admin: true, premium: false, age: Date.current.change(year: Date.current.year-20))
user1	= User.find_or_create_by(name: 'user1', lastName: 'Perezu1', email: 'user1@mail.com', password: '12345', admin: false, premium: false, age: Date.current.change(year: Date.current.year-20))
user2	= User.find_or_create_by(name: 'user2', lastName: 'Perezu2', email: 'user2@mail.com', password: '12345', admin: false, premium: false, age: Date.current.change(year: Date.current.year-20))
user3	= User.find_or_create_by(name: 'user3', lastName: 'Perezu3', email: 'user3@mail.com', password: '12345', admin: false, premium: true, age: Date.current.change(year: Date.current.year-20))

# Couches
Couch.find_or_create_by(name: 'Sillon Azul1', description: 'Un sillon azul muy comodo. Para una persona que quiera pasar unas noches sin disgustos en La Plata y disfruar de las atracciones que brinda esta cuidad.', location: 'La Plata', dateBegin: Date.current, dateEnd: Date.current.change(year: Date.current.year+1), maxHosts: 1, image: 'http://i.imgur.com/hwlWzBk.jpg', user: user1, type: sillon)
Couch.find_or_create_by(name: 'Sillon Azul2', description: 'Un sillon azul muy comodo. Para una persona que quiera pasar unas noches sin disgustos en La Plata y disfruar de las atracciones que brinda esta cuidad.', location: 'La Plata', dateBegin: Date.current, dateEnd: Date.current.change(year: Date.current.year+1), maxHosts: 1, image: 'http://i.imgur.com/hwlWzBk.jpg', user: user1, type: sillon)
Couch.find_or_create_by(name: 'Sillon Azul3', description: 'Un sillon azul muy comodo. Para una persona que quiera pasar unas noches sin disgustos en La Plata y disfruar de las atracciones que brinda esta cuidad.', location: 'La Plata', dateBegin: Date.current, dateEnd: Date.current.change(year: Date.current.year+1), maxHosts: 1, image: 'http://i.imgur.com/hwlWzBk.jpg', user: user1, type: sillon)
Couch.find_or_create_by(name: 'Sillon Azul4', description: 'Un sillon azul muy comodo. Para una persona que quiera pasar unas noches sin disgustos en La Plata y disfruar de las atracciones que brinda esta cuidad.', location: 'La Plata', dateBegin: Date.current, dateEnd: Date.current.change(year: Date.current.year+1), maxHosts: 1, image: 'http://i.imgur.com/hwlWzBk.jpg', user: user1, type: sillon)

Couch.find_or_create_by(name: 'Cama Roja1', description: 'Un cama roja muy comoda. Para una pareja que quiera pasar unas noches sin disgustos en La Plata y disfruar de las atracciones que brinda esta cuidad.', location: 'La Plata', dateBegin: Date.current, dateEnd: Date.current.change(year: Date.current.year+1), maxHosts: 2, image: 'http://blogdecoraciones.com/wp-content/uploads/cama-roja.jpg', user: user2, type: cama)
Couch.find_or_create_by(name: 'Cama Roja2', description: 'Un cama roja muy comoda. Para una pareja que quiera pasar unas noches sin disgustos en La Plata y disfruar de las atracciones que brinda esta cuidad.', location: 'La Plata', dateBegin: Date.current, dateEnd: Date.current.change(year: Date.current.year+1), maxHosts: 2, image: 'http://blogdecoraciones.com/wp-content/uploads/cama-roja.jpg', user: user2, type: cama)
Couch.find_or_create_by(name: 'Cama Roja3', description: 'Un cama roja muy comoda. Para una pareja que quiera pasar unas noches sin disgustos en La Plata y disfruar de las atracciones que brinda esta cuidad.', location: 'La Plata', dateBegin: Date.current, dateEnd: Date.current.change(year: Date.current.year+1), maxHosts: 2, image: 'http://blogdecoraciones.com/wp-content/uploads/cama-roja.jpg', user: user2, type: cama)
Couch.find_or_create_by(name: 'Cama Roja4', description: 'Un cama roja muy comoda. Para una pareja que quiera pasar unas noches sin disgustos en La Plata y disfruar de las atracciones que brinda esta cuidad.', location: 'La Plata', dateBegin: Date.current, dateEnd: Date.current.change(year: Date.current.year+1), maxHosts: 2, image: 'http://blogdecoraciones.com/wp-content/uploads/cama-roja.jpg', user: user2, type: cama)

Couch.find_or_create_by(name: 'Hamaca Verde1', description: 'Un hamaca verde muy comoda. Para una persona que quiera pasar unas noches sin disgustos en La Plata y disfruar de las atracciones que brinda esta cuidad.', location: 'La Plata', dateBegin: Date.current, dateEnd: Date.current.change(year: Date.current.year+1), maxHosts: 1, image: 'http://www.siesting.es/archivos/hamaca-doble-intemperie-sonrisa.jpg', user: user3, type: hamaca)
Couch.find_or_create_by(name: 'Hamaca Verde2', description: 'Un hamaca verde muy comoda. Para una persona que quiera pasar unas noches sin disgustos en La Plata y disfruar de las atracciones que brinda esta cuidad.', location: 'La Plata', dateBegin: Date.current, dateEnd: Date.current.change(year: Date.current.year+1), maxHosts: 1, image: 'http://www.siesting.es/archivos/hamaca-doble-intemperie-sonrisa.jpg', user: user3, type: hamaca)
Couch.find_or_create_by(name: 'Hamaca Verde3', description: 'Un hamaca verde muy comoda. Para una persona que quiera pasar unas noches sin disgustos en La Plata y disfruar de las atracciones que brinda esta cuidad.', location: 'La Plata', dateBegin: Date.current, dateEnd: Date.current.change(year: Date.current.year+1), maxHosts: 1, image: 'http://www.siesting.es/archivos/hamaca-doble-intemperie-sonrisa.jpg', user: user3, type: hamaca)
Couch.find_or_create_by(name: 'Hamaca Verde4', description: 'Un hamaca verde muy comoda. Para una persona que quiera pasar unas noches sin disgustos en La Plata y disfruar de las atracciones que brinda esta cuidad.', location: 'La Plata', dateBegin: Date.current, dateEnd: Date.current.change(year: Date.current.year+1), maxHosts: 1, image: 'http://www.siesting.es/archivos/hamaca-doble-intemperie-sonrisa.jpg', user: user3, type: hamaca)