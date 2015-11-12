# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all
Couch.destroy_all
Type.destroy_all

Type.find_or_create_by(name: 'Cama')
Type.find_or_create_by(name: 'default')
sillon = Type.find_or_create_by(name: 'Sillon')

juan = User.find_or_create_by(name: 'Juan', lastName: 'Perez', email: 'juanp@mail.com', password: '12345678', admin: false, premium: true)

Couch.find_or_create_by(name: 'Sillon Azul', description: 'Un sillon azul muy comodo.', location: 'La Plata', dateBegin: DateTime.current, dateEnd: DateTime.current.change(day: 15), maxHosts: 1, image: 'http://i.imgur.com/hwlWzBk.jpg', user: juan, type: sillon)