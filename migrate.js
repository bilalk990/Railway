const mysql = require('mysql2/promise');

async function runMigration() {
    const connectionString = "mysql://root:CIOkwduTOqDglFYqoHlhTkDDLWyKKXNV@yamanote.proxy.rlwy.net:17583/railway";

    try {
        const connection = await mysql.createConnection(connectionString);
        console.log("Connected to Railway MySQL DB.");

        // Check missing columns
        const columnsToAdd = [
            'country VARCHAR(255) NULL',
            'state VARCHAR(255) NULL',
            'notify VARCHAR(255) NULL',
            'phone_prefix VARCHAR(255) NULL',
            'phone_country_code VARCHAR(255) NULL'
        ];

        for (const col of columnsToAdd) {
            const colName = col.split(' ')[0];
            try {
                await connection.execute(`ALTER TABLE users ADD COLUMN ${col}`);
                console.log(`Added column ${colName}`);
            } catch (err) {
                if (err.code === 'ER_DUP_FIELDNAME') {
                    console.log(`Column ${colName} already exists, skipping.`);
                } else {
                    console.error(`Error adding ${colName}:`, err.message);
                }
            }
        }

        await connection.end();
        console.log("Migration finished.");
    } catch (error) {
        console.error("Database connection failed:", error.message);
    }
}

runMigration();
