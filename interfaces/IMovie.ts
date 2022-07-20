import { RowDataPacket } from 'mysql2';

export default interface IMovie extends RowDataPacket {
    id: number;
    name: string;
    cover: string;
    trailer: string;
    year: string;
    director: string;
    length: string;
    idType: number;
}
