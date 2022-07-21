import moviesController from './controllers/movies';
import typesController from './controllers/types'
import { Express } from 'express';

const setupRoutes = (server: Express) => {
  // TYPES
  // get types
  server.get('/api/types', typesController.getAllTypes);
  // get movie by id
  server.get('/api/types/:idType', typesController.getTypeById);

  //--IDPAGETYPE--
  server.get(
    '/api/types/:idType/movies',
    moviesController.getMoviesByIdType
  );


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
