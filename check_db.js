const mysql = require('mysql2/promise');

async function checkPassportTables() {
    const connection = await mysql.createConnection("mysql://root:E4vJAWM5fjde_CkgyrhjZarK1IA@mysql.railway.internal:3306/railway");
    try {
        const [rows] = await connection.execute('SHOW TABLES LIKE "oauth%"');
        console.log("Passport tables:", JSON.stringify(rows));

        const [userRows] = await connection.execute('DESCRIBE users');
        console.log("User table schema:", JSON.stringify(userRows));
    } catch (err) {
        console.error(err);
    } finally {
        await connection.end();
    }
}

checkPassportTables();
