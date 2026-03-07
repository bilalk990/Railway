const mysql = require('mysql2/promise');

async function listUsers() {
    const connection = await mysql.createConnection("mysql://root:E4vJAWM5fjde_CkgyrhjZarK1IA@mysql.railway.internal:3306/railway");
    try {
        const [rows] = await connection.execute('SELECT email FROM users LIMIT 10');
        console.log(JSON.stringify(rows));
    } catch (err) {
        console.error(err);
    } finally {
        await connection.end();
    }
}

listUsers();
