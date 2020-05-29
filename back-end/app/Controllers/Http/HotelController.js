'use strict'

const Hotel = use('App/Models/Hotel');

class HotelController {

  async getAll() {
    const hotels = Hotel.query().fetch();

    return hotels;
  }

}

module.exports = HotelController
