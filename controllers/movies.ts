import { Request, Response, NextFunction, RequestHandler } from 'express';
import Movie from '../models/movie';
import { ErrorHandler } from '../helpers/errors';
import IMovie from '../interfaces/IMovie';

//GET ALL MOVIES
const getAllMovies = (async (
    req: Request,
    res: Response,
    next: NextFunction
) => {
    try {
        const movies = await Movie.getAllMovies();
        res.setHeader(
            'Content-Range',
            `movies : 0-${movies.length}/${movies.length + 1}`
        );
        return res.status(200).json(movies);
    } catch (err) {
        next(err);
    }
}) as RequestHandler;

// GET BY ID
const getMovieById = (async (
    req: Request,
    res: Response,
    next: NextFunction
) => {
    try {
        const { idMovie } = req.params;
        const movies = await Movie.getMovieById(Number(idMovie));
        movies ? res.status(200).json(movies) : res.sendStatus(404);
    } catch (err) {
        next(err);
    }
}) as RequestHandler;

// GET BY IDMOVIETYPE
const getMoviesByIdType = (async (
    req: Request,
    res: Response,
    next: NextFunction
) => {
    try {
        const { idType } = req.params;
        const movies = await Movie.getMoviesByIdType(Number(idType));
        if (movies) {
            res.setHeader(
                'Content-Range',
                `movies : 0-${movies.length}/${movies.length + 1}`
            );
            res.status(200).json(movies)
        }
        else res.sendStatus(404);

    } catch (err) {
        next(err);
    }
}) as RequestHandler;

const getMovieType = async (req: Request, res: Response, next: NextFunction) => {
    try {
        req.body.idType = req.params.idType;
        next()
    } catch (err) {
        next(err);
    }
};

// ADD MOVIE
const addMovie = async (req: Request, res: Response, next: NextFunction) => {
    try {
        const idMovie = await Movie.addMovie(req.body as IMovie);
        if (idMovie) {
            res.status(201).json({ id: idMovie, ...req.body });
        } else {
            throw new ErrorHandler(500, `Movie cannot be created`);
        }
    } catch (err) {
        next(err);
    }
};

//UPDATE MOVIE
const updateMovie = async (req: Request, res: Response, next: NextFunction) => {
    try {
        const { idMovie } = req.params;
        const moviesUpdated = await Movie.updateMovie(
            Number(idMovie),
            req.body as IMovie
        );
        if (moviesUpdated) {
            const movies = await Movie.getMovieById(Number(idMovie));
            res.status(200).send(movies); // react-admin needs this response
        } else {
            throw new ErrorHandler(500, `movie cannot be updated`);
        }
    } catch (err) {
        next(err);
    }
};

interface RequestWithRecord extends Request {
    record?: any;
}

//DELETE MOVIE
const deleteMovie = async (req: RequestWithRecord, res: Response, next: NextFunction) => {
    try {
        const { idMovie } = req.params;
        const movieDeleted = await Movie.deleteMovie(Number(idMovie));
        if (movieDeleted) {
            res.status(200).send(req.record); // react-admin needs this response
        } else {
            throw new ErrorHandler(409, `movie not found`);
        }
    } catch (err) {
        next(err);
    }
};

export default {
    getAllMovies,
    getMovieById,
    getMovieType,
    getMoviesByIdType,
    addMovie,
    updateMovie,
    deleteMovie,
};
