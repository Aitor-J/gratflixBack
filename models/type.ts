import { ResultSetHeader } from 'mysql2';
import connection from '../db-config';
import IType from '../interfaces/IType';

//GET ALL TYPES
const getAllTypes = async (): Promise<IType[]> => {
    const sql: string = `SELECT * from types`;
    const results = await connection.promise().query<IType[]>(sql);
    return results[0];
};

// GET TYPE BY ID
const getTypeById = async (idType: number): Promise<IType> => {
    const [results] = await connection
        .promise()
        .query<IType[]>('SELECT * FROM types WHERE id = ?', [idType]);
    return results[0];
};



export default { getAllTypes, getTypeById };
