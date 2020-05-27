'use strict'

/** @type {typeof import('@adonisjs/lucid/src/Lucid/Model')} */
const Model = use('Model')

class Hotel extends Model {
    Destination() {
        return this.belongsTo('App/Models/Destination');
    }
}

module.exports = Hotel
