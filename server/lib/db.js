import mysql from 'mysql2/promise'

let connection;

export const connectToDatabase = async () => {

    if (!connection) {
        connection = await mysql.createConnection({
            host: "127.0.0.1",
            user: "root",
            password: "Toor777.",
            database: "gestion_pruebas"
        })

    }
    return connection
}

