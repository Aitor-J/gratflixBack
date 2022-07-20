import { RowDataPacket } from 'mysql2';

export default interface IType extends RowDataPacket {
    id: number;
    name: string;
}
