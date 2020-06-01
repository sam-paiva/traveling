'use strict'

const User = use('App/Models/User');

class UserController {
    async create({ request }) {
        const data = request.only(["username", "email", "password"])

        const user = await User.create(data)

        return user
    }

    async getUserDataByEmail({ request }) {
        const { email } = request.all();
        const user = User.findBy('email', email);

        return user;
    }
}

module.exports = UserController
