'use strict'

/** @type {import('@adonisjs/lucid/src/Schema')} */
const Schema = use('Schema')

class HotelSchema extends Schema {
  up() {
    this.create('hotels', (table) => {
      table.increments()
      table.string('name', 100).notNullable(),
        table.string('address', 100).notNullable(),
        table.string('imageUrl'),
        table.double('price').notNullable(),
        table.string('phone', 15).notNullable(),
        table.string('city', 100).notNullable(),
        table.integer('userId').unsigned().
          references('id').inTable('users').onUpdate('CASCADE').onDelete('CASCADE')
      table.timestamps()
    })
  }

  down() {
    this.drop('hotels')
  }
}

module.exports = HotelSchema
