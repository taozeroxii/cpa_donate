โปรแกรมรับบริจาคสิ่งของเบื้องต้น nodejs + vuejs +  template vuetify +alert alertify

# fontend
npm install
npm run serve

# backend
เช็คไฟล์ configs -> mycon มีไหม เพิ่มไปแล้วใส่ config mysql
const mysql = require('mysql');
const connection  = mysql.createConnection({
  host            : '',
  user            : '',
  password        : '',
  database        : 'cpadonate_db',
  charset:'utf8'
});
//connection.getConnection((err,connect)=> console.log(err));//เช็ค connection 
module.exports = connection;

npm install 
npm start



user ทดสอบ admin taotest

