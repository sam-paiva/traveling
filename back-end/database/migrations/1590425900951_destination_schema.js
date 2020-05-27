'use strict'

/** @type {import('@adonisjs/lucid/src/Schema')} */
const Schema = use('Schema')

class DestinationSchema extends Schema {
  up() {
    this.create('destinations', (table) => {
      table.increments()
      table.string('imageUrl', 1000)
      table.string('city', 50)
      table.string('country', 30),
        table.timestamps()
    })
  }

  down() {
    this.drop('destinations')
  }
}

module.exports = DestinationSchema
