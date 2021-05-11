const mysql = require('mysql');

const connection  = mysql.createConnection({
  host            : '172.18.2.2',
  user            : '',
  password        : '!',
  database        : '',
  charset:'utf8'
});

//connection.getConnection((err,connect)=> console.log(err));//เช็ค connection 
module.exports = connection;