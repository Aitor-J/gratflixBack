import { Request, Response, NextFunction, RequestHandler } from 'express';
import Type from '../models/type';
import { ErrorHandler } from '../helpers/errors';
import IType from '../interfaces/IType';

//GET ALL MOVIES
const getAllTypes = (async (
    req: Request,
    res: Response,
    next: NextFunction
) => {
    try {
        const types = await Type.getAllTypes();
        res.setHeader(
            'Content-Range',
            `types : 0-${types.length}/${types.length + 1}`
        );
        return res.status(200).json(types);
    } catch (err) {
        next(err);
    }
}) as RequestHandler;

// GET BY ID
const getTypeById = (async (
    req: Request,
    res: Response,
    next: NextFunction
) => {
    try {
        const { idType } = req.params;
        const types = await Type.getTypeById(Number(idType));
        types ? res.status(200).json(types) : res.sendStatus(404);
    } catch (err) {
        next(err);
    }
}) as RequestHandler;


export default {
    getAllTypes,
    getTypeById
};
