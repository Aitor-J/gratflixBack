import { ResultSetHeader } from 'mysql2';
import connection from '../db-config';
import IMovie from '../interfaces/IMovie';

//GET ALL MOVIES
const getAllMovies = async (): Promise<IMovie[]> => {
    const sql: string = `SELECT * from movies`;
    const results = await connection.promise().query<IMovie[]>(sql);
    return results[0];
};

// GET MOVIE BY ID
const getMovieById = async (idMovie: number): Promise<IMovie> => {
    const [results] = await connection
        .promise()
        .query<IMovie[]>('SELECT * FROM movies WHERE id = ?', [idMovie]);
    return results[0];
};

// GET BY IDTYPE
const getMoviesByIdType = async (idType: number): Promise<IMovie[]> => {
    const results = await connection
        .promise()
        .query<IMovie[]>('SELECT * FROM movies WHERE idType = ?', [idType]);
    return results[0];
};

// ADD NEW MOVIE
const addMovie = async (movie: IMovie): Promise<number> => {
    const results = await connection
        .promise()
        .query<ResultSetHeader>(
            'INSERT INTO movies (name, cover, year, director, length, idType) VALUES (?, ?, ?, ?, ?, ?)',
            [
                movie.name,
                movie.cover,
                movie.year,
                movie.director,
                movie.length,
                movie.idType
            ]
        );
    return results[0].insertId;
};

// UPDATE 1 MOVIE
const updateMovie = async (idMovie: number, movie: IMovie): Promise<boolean> => {
    let sql: string = 'UPDATE movies SET ';
    [];
    const sqlValues: Array<string | number> = [];
    let oneValue: boolean = false;

    if (movie.name) {
        sql += 'name = ? ';
        sqlValues.push(movie.name);
        oneValue = true;
    }
    if (movie.cover) {
        sql += oneValue ? ', cover = ? ' : ' cover = ? ';
        sqlValues.push(movie.cover);
        oneValue = true;
    }
    if (movie.year) {
        sql += oneValue ? ', year = ? ' : ' year = ? ';
        sqlValues.push(movie.year);
        oneValue = true;
    }
    if (movie.director) {
        sql += oneValue ? ', director = ? ' : ' director = ? ';
        sqlValues.push(movie.director);
        oneValue = true;
    }
    if (movie.length) {
        sql += oneValue ? ', length = ? ' : ' length = ? ';
        sqlValues.push(movie.length);
        oneValue = true;
    }
    if (movie.idType) {
        sql += oneValue ? ', idType = ? ' : ' idType = ? ';
        sqlValues.push(movie.idType);
        oneValue = true;
    }
    sql += ' WHERE id = ?';
    sqlValues.push(idMovie);

    const results = await connection
        .promise()
        .query<ResultSetHeader>(sql, sqlValues);
    return results[0].affectedRows === 1;
};

//DELETE MOVIE
const deleteMovie = async (idMovie: number): Promise<boolean> => {
    const results = await connection
        .promise()
        .query<ResultSetHeader>('DELETE FROM movies WHERE id = ?', [idMovie]);
    return results[0].affectedRows === 1;
};

export default { getAllMovies, getMovieById, getMoviesByIdType, addMovie, updateMovie, deleteMovie };
