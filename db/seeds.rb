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
RatingUser.destroy_all
RatingCouch.destroy_all

# Tipos de couch
default	= Type.find_or_create_by(name: 'default')
cama	= Type.find_or_create_by(name: 'Cama')
sillon	= Type.find_or_create_by(name: 'Sillon')
hamaca	= Type.find_or_create_by(name: 'Hamaca')

# Usuarios
# Como le agrego el campo encrypted_password: ??
admin1	= User.find_or_create_by(name: 'Jose', lastName: 'Ballesteros', email: 'joseb@couchinn.com', password: 'joseb83', admin: true, premium: false, age: Date.current-32.year, card_number: '0', card_security_number: '0')
admin2	= User.find_or_create_by(name: 'Emilia', lastName: 'Marquez', email: 'emiliam@couchinn.com', password: 'emiliam88', admin: true, premium: false, age: Date.current-27.year, card_number: '0', card_security_number: '0')
user1	= User.find_or_create_by(name: 'Gabriel', lastName: 'Navarro', email: 'gabrieln@couchinn.com', password: 'gabrieln94', admin: false, premium: false, age: Date.current-21.year, card_number: '0', card_security_number: '0')
user2	= User.find_or_create_by(name: 'Sergio', lastName: 'Saenz', email: 'sergios@couchinn.com', password: 'sergios86', admin: false, premium: false, age: Date.current-29.year, card_number: '0', card_security_number: '0')
user3	= User.find_or_create_by(name: 'Isabel', lastName: 'Castrillo', email: 'isabelc@couchinn.com', password: 'isabelc80', admin: false, premium: true, age: Date.current-35.year, card_number: '0', card_security_number: '0')

# Couches
Couch.find_or_create_by(name: 'Sillon Azul 1', description: 'Un sillon azul muy comodo. Para una persona que quiera pasar unas noches sin disgustos en La Plata y disfruar de las atracciones que brinda esta cuidad.', location: 'La Plata', dateBegin: Date.current+1.year, dateEnd: Date.current+2.year, maxHosts: 1, image: 'http://i.imgur.com/hwlWzBk.jpg', user: user1, type: sillon)
c1 = Couch.find_or_create_by(name: 'Sillon Azul 2', description: 'Un sillon azul muy comodo. Para una persona que quiera pasar unas noches sin disgustos en La Plata y disfruar de las atracciones que brinda esta cuidad.', location: 'La Plata', dateBegin: Date.current+1.year, dateEnd: Date.current+2.year, maxHosts: 1, image: 'http://i.imgur.com/hwlWzBk.jpg', user: user1, type: sillon)
Couch.find_or_create_by(name: 'Sillon Azul 3', description: 'Un sillon azul muy comodo. Para una persona que quiera pasar unas noches sin disgustos en La Plata y disfruar de las atracciones que brinda esta cuidad.', location: 'La Plata', dateBegin: Date.current+1.year, dateEnd: Date.current+2.year, maxHosts: 1, image: 'http://i.imgur.com/hwlWzBk.jpg', user: user1, type: sillon)
Couch.find_or_create_by(name: 'Sillon Azul 4', description: 'Un sillon azul muy comodo. Para una persona que quiera pasar unas noches sin disgustos en La Plata y disfruar de las atracciones que brinda esta cuidad.', location: 'La Plata', dateBegin: Date.current+1.year, dateEnd: Date.current+2.year, maxHosts: 1, image: 'http://i.imgur.com/hwlWzBk.jpg', user: user1, type: sillon)

c2 = Couch.find_or_create_by(name: 'Cama Roja 1', description: 'Un cama roja muy comoda. Para una pareja que quiera pasar unas noches sin disgustos en La Plata y disfruar de las atracciones que brinda esta cuidad.', location: 'La Plata', dateBegin: Date.current+1.year, dateEnd: Date.current+2.year, maxHosts: 2, image: 'http://blogdecoraciones.com/wp-content/uploads/cama-roja.jpg', user: user2, type: cama)
c3 = Couch.find_or_create_by(name: 'Cama Roja 2', description: 'Un cama roja muy comoda. Para una pareja que quiera pasar unas noches sin disgustos en La Plata y disfruar de las atracciones que brinda esta cuidad.', location: 'La Plata', dateBegin: Date.current+1.year, dateEnd: Date.current+2.year, maxHosts: 2, image: 'http://blogdecoraciones.com/wp-content/uploads/cama-roja.jpg', user: user2, type: cama)
c4 = Couch.find_or_create_by(name: 'Cama Roja 3', description: 'Un cama roja muy comoda. Para una pareja que quiera pasar unas noches sin disgustos en La Plata y disfruar de las atracciones que brinda esta cuidad.', location: 'La Plata', dateBegin: Date.current+1.year, dateEnd: Date.current+2.year, maxHosts: 2, image: 'http://blogdecoraciones.com/wp-content/uploads/cama-roja.jpg', user: user2, type: cama)
Couch.find_or_create_by(name: 'Cama Roja 4', description: 'Un cama roja muy comoda. Para una pareja que quiera pasar unas noches sin disgustos en La Plata y disfruar de las atracciones que brinda esta cuidad.', location: 'La Plata', dateBegin: Date.current+1.year, dateEnd: Date.current+2.year, maxHosts: 2, image: 'http://blogdecoraciones.com/wp-content/uploads/cama-roja.jpg', user: user2, type: cama)

Couch.find_or_create_by(name: 'Hamaca Verde 1', description: 'Un hamaca verde muy comoda. Para una persona que quiera pasar unas noches sin disgustos en La Plata y disfruar de las atracciones que brinda esta cuidad.', location: 'La Plata', dateBegin: Date.current+1.year, dateEnd: Date.current+2.year, maxHosts: 1, image: 'http://www.siesting.es/archivos/hamaca-doble-intemperie-sonrisa.jpg', user: user3, type: hamaca)
Couch.find_or_create_by(name: 'Hamaca Verde 2', description: 'Un hamaca verde muy comoda. Para una persona que quiera pasar unas noches sin disgustos en La Plata y disfruar de las atracciones que brinda esta cuidad.', location: 'La Plata', dateBegin: Date.current+1.year, dateEnd: Date.current+2.year, maxHosts: 1, image: 'http://www.siesting.es/archivos/hamaca-doble-intemperie-sonrisa.jpg', user: user3, type: hamaca)
c6 = Couch.find_or_create_by(name: 'Hamaca Verde 3', description: 'Un hamaca verde muy comoda. Para una persona que quiera pasar unas noches sin disgustos en La Plata y disfruar de las atracciones que brinda esta cuidad.', location: 'La Plata', dateBegin: Date.current+1.year, dateEnd: Date.current+2.year, maxHosts: 1, image: 'http://www.siesting.es/archivos/hamaca-doble-intemperie-sonrisa.jpg', user: user3, type: hamaca)
c5 = Couch.find_or_create_by(name: 'Hamaca Verde 4', description: 'Un hamaca verde muy comoda. Para una persona que quiera pasar unas noches sin disgustos en La Plata y disfruar de las atracciones que brinda esta cuidad.', location: 'La Plata', dateBegin: Date.current+1.year, dateEnd: Date.current+2.year, maxHosts: 1, image: 'http://www.siesting.es/archivos/hamaca-doble-intemperie-sonrisa.jpg', user: user3, type: hamaca)

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
# para c1
Question.find_or_create_by(ask: '¿El sillon es muy azul?', answer: 'Tiene un poco de amarillo tambien.', couch: c1, user: user2)
Question.find_or_create_by(ask: '¿El sillon esta limpio?', answer: 'Sí', couch: c1, user: user2)
Question.find_or_create_by(ask: '¿Esta a la intemperie?', answer: 'No', couch: c1, user: user3)
Question.find_or_create_by(ask: '¿Esta en el centro?', couch: c1, user: user3)
# para c2
Question.find_or_create_by(ask: '¿La cama es muy roja?', answer: 'Tiene un poco de amarillo tambien.', couch: c2, user: user3)
Question.find_or_create_by(ask: '¿La cama esta limpia?', answer: 'Sí', couch: c2, user: user3)
Question.find_or_create_by(ask: '¿Esta a la intemperie?', answer: 'No', couch: c2, user: user1)
Question.find_or_create_by(ask: '¿Esta en el centro?', couch: c2, user: user1)
# para c5
Question.find_or_create_by(ask: '¿La hamaca es muy verde?', answer: 'Tiene un poco de amarillo tambien.', couch: c5, user: user2)
Question.find_or_create_by(ask: '¿La hamaca esta limpia?', answer: 'Sí', couch: c5, user: user2)
Question.find_or_create_by(ask: '¿Esta a la intemperie?', answer: 'No', couch: c5, user: user1)
Question.find_or_create_by(ask: '¿Esta en el centro?', couch: c5, user: user1)
# para c6
Question.find_or_create_by(ask: '¿La hamaca esta limpia?', couch: c6, user: user2)
Question.find_or_create_by(ask: '¿Esta a la intemperie?', couch: c6, user: user1)
Question.find_or_create_by(ask: '¿Esta en el centro?', couch: c6, user: user1)

#Calificaciones Couches
# para c4
RatingCouch.find_or_create_by(rating: 4, comment: 'muy comoda', couch_id: c4.id, user_id: user1.id)
RatingCouch.find_or_create_by(rating: 5, comment: 'grande', couch_id: c4.id, user_id: user3.id)
# para c5
RatingCouch.find_or_create_by(rating: 3, comment: 'esta bueno', couch_id: c5.id, user_id: user1.id)
RatingCouch.find_or_create_by(rating: 0, comment: 'La hamaca era roja', couch_id: c5.id, user_id: user1.id)
RatingCouch.find_or_create_by(rating: 5, comment: 'muy comoda', couch_id: c5.id, user_id: user2.id)
# para c3
RatingCouch.find_or_create_by(rating: 3, comment: 'esta bueno', couch_id: c3.id, user_id: user1.id)
RatingCouch.find_or_create_by(rating: 0, comment: 'La cama era verde', couch_id: c3.id, user_id: user1.id)
RatingCouch.find_or_create_by(rating: 5, comment: 'muy comoda', couch_id: c3.id, user_id: user3.id)

#Calificaciones Users
# para user1
RatingUser.find_or_create_by(rating: 5, comment: 'muy bien todo', rated_user_id: user1.id, user_id: user2.id)
RatingUser.find_or_create_by(rating: 2, comment: 'no seocmo se llama', rated_user_id: user1.id, user_id: user3.id)
# para user3
RatingUser.find_or_create_by(rating: 0, comment: 'es malo', rated_user_id: user3.id, user_id: user2.id)
RatingUser.find_or_create_by(rating: 1, comment: 'nunca se acordo mi nombre', rated_user_id: user3.id, user_id: user2.id)
RatingUser.find_or_create_by(rating: 4, comment: 'fue amable', rated_user_id: user3.id, user_id: user1.id)
