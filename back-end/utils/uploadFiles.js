
var fs = require('fs');

module.exports = {
    configureCloudinary(cloudinary) {
        cloudinary.config({
            cloud_name: 'sampaiva',
            api_key: '873666535228764',
            api_secret: '8s0rkdEexUAKUjzOlvoxx7SsvXw'
        });

        return cloudinary;
    },

    base64_encode(file) {
        // read binary data
        var bitmap = fs.readFileSync(file);
        // convert binary data to base64 encoded string
        return new Buffer(bitmap).toString('base64');
    }
}