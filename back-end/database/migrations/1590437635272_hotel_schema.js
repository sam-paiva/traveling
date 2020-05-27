'use strict'

/** @type {import('@adonisjs/lucid/src/Schema')} */
const Schema = use('Schema')

class HotelSchema extends Schema {
  up() {
    this.create('hotels', (table) => {
      table.increments()
      table.string('name', 100),
        table.string('address', 100),
        table.string('imageUrl'),
        table.double('price'),
        table.integer('destinationId').unsigned().references('id').inTable('destinations').onUpdate('CASCADE').onDelete('CASCADE'),
        table.timestamps()
    })
  }

  down() {
    this.drop('hotels')
  }
}

module.exports = HotelSchema
