const { Pool } = require('pg');

const pool = new Pool({
    user: 'postgres',
    host: 'localhost',
    database: 'empuxo',
    password: 'postgres',
    post: 5432
});

const query = (query, params) => {
    return pool.query(query, params);
}

module.exports = { query };