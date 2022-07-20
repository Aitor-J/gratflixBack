import usersController from './controllers/users';
import moviesController from './controllers/movies';
import authController from './controllers/auth';
import { Express } from 'express';

const setupRoutes = (server: Express) => {
  // USERS
  // get users
  server.get('/api/users', usersController.getAllUsers);
  // get user by id
  server.get('/api/users/:idUser', usersController.getOneUser);
  // post users, checking if email is free then adding user
  server.post(
    '/api/users',
    authController.getCurrentSession,
    authController.checkSessionPrivileges,
    usersController.validateUser,
    usersController.emailIsFree,
    usersController.addUser
  );
  // put users, checking if user exists and updates it
  server.put(
    '/api/users/:idUser',
    authController.getCurrentSession,
    authController.checkSessionPrivileges,
    usersController.validateUser,
    usersController.userExists,
    usersController.updateUser
  );
  // delete user by id
  server.delete(
    '/api/users/:idUser',
    authController.getCurrentSession,
    authController.checkSessionPrivileges,
    usersController.userExists,
    usersController.deleteUser
  );

  // LOGIN
  server.post('/api/login', authController.validateLogin, authController.login);

  // MOVIES
  // get movies
  server.get('/api/movies', moviesController.getAllMovies);
  // get movie by id
  server.get('/api/movies/:idMovie', moviesController.getMovieById);

  //--IDPAGETYPE--
  server.get(
    '/api/types/:idType/movies',
    moviesController.getMoviesByIdType
  );

  // delete movie by id
  server.delete(
    '/api/movies/:idMovie',
    moviesController.deleteMovie
  );
  // add an address
  server.post(
    '/api/movies/',
    moviesController.addMovie
  );
  // put address, checks if an address exists and updates it
  server.put(
    '/api/movies/:idMovie',
    moviesController.updateMovie
  );
};

export default setupRoutes;
