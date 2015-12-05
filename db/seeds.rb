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
Reservation.destroy_all
Question.destroy_all

# Tipos de couch
default	= Type.find_or_create_by(name: 'default')
cama	= Type.find_or_create_by(name: 'Cama')
sillon	= Type.find_or_create_by(name: 'Sillon')
hamaca	= Type.find_or_create_by(name: 'Hamaca')

# Usuarios
# Como le agrego el campo encrypted_password: ??
admin1	= User.find_or_create_by(name: 'admin1', lastName: 'Pereza1', email: 'admin1@mail.com', password: '12345', admin: true, premium: false, age: Date.current-21.year, card_number: '0', card_security_number: '0')
admin2	= User.find_or_create_by(name: 'admin2', lastName: 'Pereza1', email: 'admin2@mail.com', password: '12345', admin: true, premium: false, age: Date.current-21.year, card_number: '0', card_security_number: '0')
user1	= User.find_or_create_by(name: 'user1', lastName: 'Perezu1', email: 'user1@mail.com', password: '12345', admin: false, premium: false, age: Date.current-21.year, card_number: '0', card_security_number: '0')
user2	= User.find_or_create_by(name: 'user2', lastName: 'Perezu2', email: 'user2@mail.com', password: '12345', admin: false, premium: false, age: Date.current-21.year, card_number: '0', card_security_number: '0')
user3	= User.find_or_create_by(name: 'user3', lastName: 'Perezu3', email: 'user3@mail.com', password: '12345', admin: false, premium: true, age: Date.current-21.year, card_number: '0', card_security_number: '0')

# Couches
Couch.find_or_create_by(name: 'Sillon Azul1', description: 'Un sillon azul muy comodo. Para una persona que quiera pasar unas noches sin disgustos en La Plata y disfruar de las atracciones que brinda esta cuidad.', location: 'La Plata', dateBegin: Date.current+1.year, dateEnd: Date.current+2.year, maxHosts: 1, image: 'http://i.imgur.com/hwlWzBk.jpg', user: user1, type: sillon)
c1 = Couch.find_or_create_by(name: 'Sillon Azul2', description: 'Un sillon azul muy comodo. Para una persona que quiera pasar unas noches sin disgustos en La Plata y disfruar de las atracciones que brinda esta cuidad.', location: 'La Plata', dateBegin: Date.current+1.year, dateEnd: Date.current+2.year, maxHosts: 1, image: 'http://i.imgur.com/hwlWzBk.jpg', user: user1, type: sillon)
Couch.find_or_create_by(name: 'Sillon Azul3', description: 'Un sillon azul muy comodo. Para una persona que quiera pasar unas noches sin disgustos en La Plata y disfruar de las atracciones que brinda esta cuidad.', location: 'La Plata', dateBegin: Date.current+1.year, dateEnd: Date.current+2.year, maxHosts: 1, image: 'http://i.imgur.com/hwlWzBk.jpg', user: user1, type: sillon)
Couch.find_or_create_by(name: 'Sillon Azul4', description: 'Un sillon azul muy comodo. Para una persona que quiera pasar unas noches sin disgustos en La Plata y disfruar de las atracciones que brinda esta cuidad.', location: 'La Plata', dateBegin: Date.current+1.year, dateEnd: Date.current+2.year, maxHosts: 1, image: 'http://i.imgur.com/hwlWzBk.jpg', user: user1, type: sillon)

c2 = Couch.find_or_create_by(name: 'Cama Roja1', description: 'Un cama roja muy comoda. Para una pareja que quiera pasar unas noches sin disgustos en La Plata y disfruar de las atracciones que brinda esta cuidad.', location: 'La Plata', dateBegin: Date.current+1.year, dateEnd: Date.current+2.year, maxHosts: 2, image: 'http://blogdecoraciones.com/wp-content/uploads/cama-roja.jpg', user: user2, type: cama)
c3 = Couch.find_or_create_by(name: 'Cama Roja2', description: 'Un cama roja muy comoda. Para una pareja que quiera pasar unas noches sin disgustos en La Plata y disfruar de las atracciones que brinda esta cuidad.', location: 'La Plata', dateBegin: Date.current+1.year, dateEnd: Date.current+2.year, maxHosts: 2, image: 'http://blogdecoraciones.com/wp-content/uploads/cama-roja.jpg', user: user2, type: cama)
c4 = Couch.find_or_create_by(name: 'Cama Roja3', description: 'Un cama roja muy comoda. Para una pareja que quiera pasar unas noches sin disgustos en La Plata y disfruar de las atracciones que brinda esta cuidad.', location: 'La Plata', dateBegin: Date.current+1.year, dateEnd: Date.current+2.year, maxHosts: 2, image: 'http://blogdecoraciones.com/wp-content/uploads/cama-roja.jpg', user: user2, type: cama)
Couch.find_or_create_by(name: 'Cama Roja4', description: 'Un cama roja muy comoda. Para una pareja que quiera pasar unas noches sin disgustos en La Plata y disfruar de las atracciones que brinda esta cuidad.', location: 'La Plata', dateBegin: Date.current+1.year, dateEnd: Date.current+2.year, maxHosts: 2, image: 'http://blogdecoraciones.com/wp-content/uploads/cama-roja.jpg', user: user2, type: cama)

Couch.find_or_create_by(name: 'Hamaca Verde1', description: 'Un hamaca verde muy comoda. Para una persona que quiera pasar unas noches sin disgustos en La Plata y disfruar de las atracciones que brinda esta cuidad.', location: 'La Plata', dateBegin: Date.current+1.year, dateEnd: Date.current+2.year, maxHosts: 1, image: 'http://www.siesting.es/archivos/hamaca-doble-intemperie-sonrisa.jpg', user: user3, type: hamaca)
Couch.find_or_create_by(name: 'Hamaca Verde2', description: 'Un hamaca verde muy comoda. Para una persona que quiera pasar unas noches sin disgustos en La Plata y disfruar de las atracciones que brinda esta cuidad.', location: 'La Plata', dateBegin: Date.current+1.year, dateEnd: Date.current+2.year, maxHosts: 1, image: 'http://www.siesting.es/archivos/hamaca-doble-intemperie-sonrisa.jpg', user: user3, type: hamaca)
Couch.find_or_create_by(name: 'Hamaca Verde3', description: 'Un hamaca verde muy comoda. Para una persona que quiera pasar unas noches sin disgustos en La Plata y disfruar de las atracciones que brinda esta cuidad.', location: 'La Plata', dateBegin: Date.current+1.year, dateEnd: Date.current+2.year, maxHosts: 1, image: 'http://www.siesting.es/archivos/hamaca-doble-intemperie-sonrisa.jpg', user: user3, type: hamaca)
c5 = Couch.find_or_create_by(name: 'Hamaca Verde4', description: 'Un hamaca verde muy comoda. Para una persona que quiera pasar unas noches sin disgustos en La Plata y disfruar de las atracciones que brinda esta cuidad.', location: 'La Plata', dateBegin: Date.current+1.year, dateEnd: Date.current+2.year, maxHosts: 1, image: 'http://www.siesting.es/archivos/hamaca-doble-intemperie-sonrisa.jpg', user: user3, type: hamaca)

# Reservas
# para c1 - sin conflicto
Reservation.find_or_create_by(start_date: Date.current+1.year+1.day, end_date: Date.current+1.year+16.day, confirmed: false, user: user3, couch: c1)
# para c2 - sin conflicto
Reservation.find_or_create_by(start_date: Date.current+1.year+1.day, end_date: Date.current+1.year+16.day, confirmed: false, user: user1, couch: c2)
Reservation.find_or_create_by(start_date: Date.current+1.year+3.month+1.day, end_date: Date.current+1.year+3.month+16.day, confirmed: false, user: user3, couch: c2)
# para c3 - conflicto R2 se superpone a R1 por detras
Reservation.find_or_create_by(start_date: Date.current+1.year+1.month+1.day, end_date: Date.current+1.year+1.month+16.day, confirmed: false, user: user1, couch: c3) #R1
Reservation.find_or_create_by(start_date: Date.current+1.year+1.month+10.day, end_date: Date.current+1.year+1.month+30.day, confirmed: false, user: user3, couch: c3) #R2
Reservation.find_or_create_by(start_date: Date.current+1.year+5.month+1.day, end_date: Date.current+1.year+6.month+1.day, confirmed: true, user: user3, couch: c3) #R3
# para c4 - conflicto R2 se superpone a R1 por delante
Reservation.find_or_create_by(start_date: Date.current+1.year+2.month+10.day, end_date: Date.current+1.year+2.month+30.day, confirmed: false, user: user1, couch: c4) #R1
Reservation.find_or_create_by(start_date: Date.current+1.year+2.month+1.day, end_date: Date.current+1.year+2.month+16.day, confirmed: false, user: user3, couch: c4) #R2
Reservation.find_or_create_by(start_date: Date.current+1.year+5.month+1.day, end_date: Date.current+1.year+6.month+1.day, confirmed: false, user: user3, couch: c4) #R3
# para c5 - conflicto R2 contiene a R1
Reservation.find_or_create_by(start_date: Date.current+1.year+5.month+11.day, end_date: Date.current+1.year+5.month+20.day, confirmed: false, user: user1, couch: c5) #R1
Reservation.find_or_create_by(start_date: Date.current+1.year+5.month+1.day, end_date: Date.current+1.year+5.month+30.day, confirmed: true, user: user2, couch: c5) #R2

#Preguntas
# para c5
Question.find_or_create_by(ask: '¿La hamaca es muy verde?', answer: 'Tiene un poco de amarillo tambien.', couch: c5, user: user2)
Question.find_or_create_by(ask: '¿La hamaca esta limpia?', answer: 'Sí', couch: c5, user: user2)
Question.find_or_create_by(ask: '¿Esta a la intemperie?', answer: 'No', couch: c5, user: user1)
Question.find_or_create_by(ask: '¿Esta en el centro?', couch: c5, user: user1)
