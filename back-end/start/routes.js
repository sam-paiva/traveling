'use strict'


/** @type {typeof import('@adonisjs/framework/src/Route/Manager')} */
const Route = use('Route')

Route.get('/', () => {
  return { greeting: 'Hello world in JSON' }
});

//Destinations
Route.get('/destinations', 'DestinationController.index');

//Hotels
Route.get('/hotels', 'HotelController.getAll');

//Users
Route.post('/users', 'UserController.create');
Route.get('/users', 'UserController.getUserDataByEmail');

//Sessions
Route.post('/sessions', 'SessionController.login');


