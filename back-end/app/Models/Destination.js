'use strict'

/** @type {typeof import('@adonisjs/lucid/src/Lucid/Model')} */
const Model = use('Model')

class Destination extends Model {
    hotels() {
        return this.hasMany('App/Models/Hotel', 'id', 'destinationId');
    }
}

module.exports = Destination
