โปรแกรมรับบริจาคสิ่งของเบื้องต้น nodejs + vuejs +  template vuetify +alert alertify

# fontend สั่งรันได้เลยที่ path แรกโฟลเดอร์
npm install
npm run serve

# backend 
มีไฟล์โครงสร้าง db ไฟล์ cpadonate_db นำเข้า mysql และคอนเนคเพื่อใช้งาน
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

cd  backend
npm install 
npm start



ทดสอบ admin : admin 123456
ทดสอบ user  : a     123456

