const Hotel = use('App/Models/Hotel');
const utils = require('./../../../utils/uploadFiles');
const Helpers = use('Helpers');
var cloudinary = require('cloudinary').v2;
class HotelController {

  async getAll() {
    const hotels = Hotel.query().fetch();

    return hotels;
  }

  async storeHotel({ request }) {
    try {
      const body = request.post();

      //const base64String = utils.base64_encode(profilePic);
      if (request.file('imageBase64')) {
        cloudinary = utils.configureCloudinary(cloudinary);
        var response = await cloudinary.uploader.upload(request.file('imageBase64').tmpPath, {
          responsive_breakpoints: {
            create_derived: true, bytes_step: 20000, min_width: 200, max_width: 1000,
            transformation: { crop: 'fill', aspect_ratio: '16:9', gravity: 'auto' }
          }
        },
          function (error, result) { console.log(result); });
      }

      const hotel = new Hotel();
      hotel.name = body.name
      hotel.address = body.address
      hotel.imageUrl = response.url
      hotel.price = body.price
      hotel.phone = body.phone
      hotel.city = body.city
      hotel.userId = body.userId

      await hotel.save();
    } catch (error) {
      throw error;
    }

  }
}

module.exports = HotelController
